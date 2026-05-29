# IsoniaOS: подробная инструкция MD -> PDF

**Version:** 0.1.0  
**Date:** 2026-05-29  
**Scope:** Litepaper and Technical Whitepaper PDF publishing pipeline.

Эта инструкция описывает, как из Markdown-файлов IsoniaOS собрать аккуратные PDF-документы с титульной страницей, оглавлением, сносками, ссылками, bibliography, пагинацией и повторяемой сборкой.

## 1. Рекомендуемая структура репозитория

```text
docs/
  site/
    index.md
    litepaper.md
    whitepaper.md
    roadmap.md
  whitepaper-pdf/
    metadata-litepaper.yaml
    metadata-whitepaper.yaml
    references.bib
    header.tex
  scripts/
    build-papers-pdf.sh
  Makefile
```

`site/litepaper.md` и `site/whitepaper.md` должны оставаться source of truth. PDF считается generated artifact. Его нельзя редактировать руками.

## 2. Зависимости

На Ubuntu/Debian:

```bash
sudo apt-get update
sudo apt-get install -y pandoc texlive-xetex texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended latexmk
```

На macOS:

```bash
brew install pandoc basictex
sudo tlmgr update --self
sudo tlmgr install collection-latexrecommended collection-latexextra collection-fontsrecommended latexmk
```

Проверка:

```bash
pandoc --version
xelatex --version
latexmk --version
```

## 3. Почему Pandoc + XeLaTeX

Для whitepaper уровня Colony-style нужен не browser print, а нормальный typesetting pipeline:

```text
Markdown -> Pandoc -> LaTeX/XeLaTeX -> PDF
```

Это даёт:

- оглавление;
- сноски;
- bibliography / references;
- внутренние ссылки;
- переносы страниц;
- пагинацию;
- красивую типографику;
- стабильную повторяемую сборку.

## 4. Базовая команда для Litepaper

```bash
pandoc site/litepaper.md   --from=markdown+footnotes+definition_lists+pipe_tables+fenced_code_blocks+backtick_code_blocks+yaml_metadata_block   --metadata-file=whitepaper-pdf/metadata-litepaper.yaml   --include-in-header=whitepaper-pdf/header.tex   --toc   --pdf-engine=xelatex   -o dist/isoniaos-litepaper.pdf
```

## 5. Базовая команда для Technical Whitepaper

```bash
pandoc site/whitepaper.md   --from=markdown+footnotes+definition_lists+pipe_tables+fenced_code_blocks+backtick_code_blocks+yaml_metadata_block   --metadata-file=whitepaper-pdf/metadata-whitepaper.yaml   --include-in-header=whitepaper-pdf/header.tex   --toc   --citeproc   --bibliography=whitepaper-pdf/references.bib   --pdf-engine=xelatex   -o dist/isoniaos-technical-whitepaper.pdf
```

В текущих IsoniaOS Markdown-документах секции уже пронумерованы вручную (`## 1. Abstract`). Поэтому в команде выше **не используется** `--number-sections`, чтобы не получить двойные номера. Если позже мы уберём ручные номера из headings, можно включить:

```bash
--number-sections
```

## 6. Сноски

Markdown-сноска:

```markdown
IsoniaOS treats external records as context or evidence unless a specific model says otherwise.[^authority]

[^authority]: External records can support claims, but they do not automatically become the source of governance authority.
```

Pandoc корректно перенесёт сноску вниз страницы в PDF.

## 7. Bibliography и citations

В тексте:

```markdown
Jo Freeman's critique of structurelessness matters for DAO design [@freeman1972].
```

В `whitepaper-pdf/references.bib`:

```bibtex
@misc{freeman1972,
  author = {Freeman, Jo},
  title = {The Tyranny of Structurelessness},
  year = {1972},
  url = {https://www.jofreeman.com/joreen/tyranny.htm}
}
```

Сборка с `--citeproc` автоматически создаст references section. Если bibliography не появилась в нужном месте, добавь в Markdown:

```markdown
## References

::: {#refs}
:::
```

## 8. Mermaid-диаграммы

MkDocs умеет рендерить Mermaid в web-доках, но Pandoc/XeLaTeX не рендерит Mermaid сам по себе.

Есть три варианта:

### Вариант A — оставить Mermaid как code block

Подходит для быстрых черновых PDF. Диаграмма будет показана как код.

### Вариант B — экспортировать Mermaid в SVG

Установить Mermaid CLI:

```bash
npm install -g @mermaid-js/mermaid-cli
```

Сохранить диаграмму:

```bash
mmdc -i whitepaper-pdf/figures/governance-lifecycle.mmd -o whitepaper-pdf/figures/governance-lifecycle.svg
```

Подключить в Markdown:

```markdown
![Governance lifecycle](whitepaper-pdf/figures/governance-lifecycle.svg){#fig:lifecycle width=90%}
```

### Вариант C — отдельный pandoc filter

Это лучше сделать позже, когда diagrams стабилизируются. Для v0.1 достаточно варианта A или B.

## 9. Готовый build script

В пакете есть файл:

```text
scripts/build-papers-pdf.sh
```

Он создаёт:

```text
dist/isoniaos-litepaper.pdf
dist/isoniaos-technical-whitepaper.pdf
```

Запуск:

```bash
cd docs
bash scripts/build-papers-pdf.sh
```

Или через Makefile:

```bash
make papers-pdf
```

## 10. Проверка PDF

Минимум:

```bash
ls -lh dist/*.pdf
pdfinfo dist/isoniaos-technical-whitepaper.pdf | head
```

Визуальная проверка через render-first workflow:

```bash
python /home/oai/skills/pdfs/scripts/render_pdf.py dist/isoniaos-technical-whitepaper.pdf --out_dir /tmp/isoniaos-whitepaper-render --dpi 160
```

Если этот helper недоступен локально, используй `pdftoppm`:

```bash
mkdir -p /tmp/isoniaos-whitepaper-render
pdftoppm -png -r 160 dist/isoniaos-technical-whitepaper.pdf /tmp/isoniaos-whitepaper-render/page
```

Проверь первые страницы, страницы с таблицами, references и последние страницы. В PDF не должно быть обрезанного текста, наложений, пустых reference sections или broken glyphs.

## 11. Проверка MkDocs

PDF pipeline не заменяет web docs build:

```bash
mkdocs build
```

Если добавлен `site/litepaper.md`, обнови `mkdocs.yml`:

```yaml
nav:
  - Home: index.md
  - Litepaper: litepaper.md
  - Technical Whitepaper: whitepaper.md
  - Roadmap: roadmap.md
```

## 12. Что коммитить

Коммитить:

```text
site/litepaper.md
site/whitepaper.md
whitepaper-pdf/metadata-litepaper.yaml
whitepaper-pdf/metadata-whitepaper.yaml
whitepaper-pdf/references.bib
whitepaper-pdf/header.tex
scripts/build-papers-pdf.sh
Makefile
```

Осторожно с generated PDF. Есть два допустимых режима:

1. **Не коммитить PDF**, а собирать его в CI/release artifacts.
2. **Коммитить PDF в `site/assets/papers/`**, если docs site должен отдавать стабильный публичный файл.

Не коммитить `public/`, если это generated output MkDocs.

## 13. Рекомендуемый CI позже

```text
- install pandoc + texlive
- run mkdocs build
- run make papers-pdf
- upload PDFs as artifacts
- optionally publish PDFs into docs site assets
```

## 14. Частые проблемы

### Проблема: Unicode/glyph errors

Решение: использовать `xelatex`, а не `pdflatex`.

### Проблема: таблица вылезает за страницу

Решение: упростить таблицу, разбить её на несколько таблиц или заменить на список.

### Проблема: Mermaid не отображается картинкой

Решение: экспортировать Mermaid в SVG через `mmdc`.

### Проблема: bibliography не появилась

Решение: проверить `--citeproc`, путь к `references.bib`, совпадение citation keys и наличие `::: {#refs} :::`.

### Проблема: двойная нумерация секций

Решение: либо оставить ручные номера и не использовать `--number-sections`, либо убрать ручные номера и включить `--number-sections`.
