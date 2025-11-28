# pdftotext

Utilitário simples em Bash para converter todos os PDFs da pasta atual em arquivos `.txt`, preservando o layout original e pulando conversões já feitas.

## Scripts incluídos
- `pdftotext.sh`: varre os PDFs, usa `pdftotext -layout` para gerar o `.txt` correspondente, pula se o `.txt` já existe e avisa quando não há PDFs.
- `create_and_push_repo.sh`: inicializa/configura o Git e automatiza push/pull para o repositório `luascfl/<pasta>`, usando `GITHUB_TOKEN` e Git LFS quando necessário.

## Requisitos
- `pdftotext` (pacote `poppler-utils` em distribuições Debian/Ubuntu):
  - Instalação sugerida: `sudo apt install poppler-utils`
- `bash`, `coreutils`
- Para publicar com o script de Git: `git`, `git-lfs`, `curl`, `python3` e uma variável/arquivo `GITHUB_TOKEN`.

## Como usar o conversor
1. Coloque seus arquivos `.pdf` na mesma pasta que `pdftotext.sh`.
2. Execute: `bash pdftotext.sh`
3. Para cada PDF, será gerado um `.txt` com o mesmo nome, preservando espaçamentos (`-layout`). Se o `.txt` já existir, o arquivo é pulado. Se não houver PDFs, o script apenas informa.
4. Os `.txt` ficam na mesma pasta dos PDFs originais.

## Publicando no GitHub (opcional)
1. Tenha um token válido do GitHub na variável de ambiente `GITHUB_TOKEN` ou no arquivo `GITHUB_TOKEN`/`GITHUB_TOKEN.txt` (primeira linha).
2. Rode: `bash create_and_push_repo.sh` e escolha `push` (padrão).
3. O script cria o repositório remoto (público, a menos que a pasta comece com `tmp_`), garante a branch `main`, configura `origin`, faz commit/push e aplica Git LFS em arquivos grandes se necessário. Arquivos de tokens são ignorados automaticamente.

## Notas
- O loop usa `nullglob` para evitar iterações quando não há PDFs.
- A flag `-layout` ajuda a manter a formatação visual do PDF no texto extraído.
