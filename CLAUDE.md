# Painel de Resultados · Ortomobil

Site publicado via GitHub Pages: https://waganari404.github.io/ortomobil-painel/

## Estrutura
- `src/index.html` — painel em texto aberto. Fonte de verdade. Fica só nesta máquina (está no .gitignore) e nunca vai para o repositório, que é público.
- `index.html` — versão criptografada gerada pelo StatiCrypt. É o único HTML que sobe.
- `template.html` — tela de login com a identidade Ortomobil. Não alterar sem pedido explícito.
- `.staticrypt.json` — salt fixo. Não trocar, senão quem marcou "lembrar por 30 dias" precisa digitar a senha de novo.
- `.env` — `STATICRYPT_PASSWORD`. Local, nunca commitar, nunca mostrar o valor no chat.

## Para atualizar o painel
1. Editar `src/index.html` com o que o Wagner pedir (dados novos, seções, ajustes visuais).
2. Rodar `./publicar.ps1` — criptografa, faz commit e push.
3. Conferir em ~1 min se o site respondeu (status 200) e avisar o link.

## Regras
- Nunca commitar `src/` nem `.env`. Antes de qualquer `git add` manual, checar `git status`.
- Não deixar textos explicativos, notas ou legendas de explicação no painel.
- O painel precisa continuar um HTML único e autocontido (CSS/JS inline, imagens em data URI).
