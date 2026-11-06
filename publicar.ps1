$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

if (-not (Test-Path "src/index.html")) { throw "Arquivo src/index.html não encontrado." }
if (-not (Test-Path ".env")) { throw "Arquivo .env com STATICRYPT_PASSWORD não encontrado." }

npx -y staticrypt@3.5.4 src/index.html `
  --short `
  --remember 30 `
  -t template.html `
  --template-error "Senha incorreta. Tente novamente." `
  --template-toggle-show "Mostrar senha" `
  --template-toggle-hide "Ocultar senha" `
  -d .

git add index.html template.html .staticrypt.json .gitignore .env.example CLAUDE.md publicar.ps1
git diff --cached --quiet
if ($LASTEXITCODE -eq 0) { Write-Host "Nada mudou no painel."; exit 0 }

git commit -m "Atualiza painel $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
git push
Write-Host "Publicado: https://waganari404.github.io/ortomobil-painel/"
