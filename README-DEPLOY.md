# 🚀 Guia de Deploy - Metalplan

## 📋 Configuração Inicial

### 1. Configurar Git
```bash
# Configurar usuário para este repositório
git config user.name "adsdentech-web"
git config user.email "adsdentech-web@users.noreply.github.com"

# Verificar configuração
git config --list
```

### 2. Configurar Remote
```bash
# Verificar remote atual
git remote -v

# Configurar remote correto
git remote set-url origin https://github.com/adsdentech-web/metalplan.git
```

## 🔄 Deploy Automático

### Opção 1: Script Automático
```bash
# Executar script de deploy
./deploy.sh
```

### Opção 2: Comandos Manuais
```bash
# Adicionar alterações
git add .

# Fazer commit
git commit -m "Atualização: $(date)"

# Enviar para GitHub
git push origin main
```

### Opção 3: Alias Git
```bash
# Usar alias configurado
git push-auto
```

## 🔑 Solução para Problemas de Permissão

### 1. Token de Acesso Pessoal
1. Acesse: https://github.com/settings/tokens
2. Clique em "Generate new token (classic)"
3. Selecione escopo: `repo`
4. Copie o token gerado

### 2. Configurar Credenciais
```bash
# Configurar credenciais
git config --global credential.helper store
git push origin main
# Usuário: adsdentech-web
# Senha: [token gerado]
```

### 3. URL com Token
```bash
# Usar URL com token
git remote set-url origin https://[TOKEN]@github.com/adsdentech-web/metalplan.git
```

## 📱 Monitoramento em Tempo Real

### 1. GitHub Actions (Recomendado)
- Configure GitHub Actions para deploy automático
- Conecte com Vercel, Netlify ou similar

### 2. Webhook
- Configure webhook para sincronização automática
- Integre com serviços de hosting

### 3. Cron Job
```bash
# Adicionar ao crontab para sincronização automática
*/5 * * * * cd /Users/patrickdiasparis/metalplan && ./deploy.sh
```

## 🎯 Fluxo de Trabalho Recomendado

1. **Desenvolver** → Fazer alterações no código
2. **Testar** → Verificar funcionamento local
3. **Deploy** → Executar `./deploy.sh`
4. **Verificar** → Confirmar no GitHub
5. **Monitorar** → Acompanhar deploy automático

## 🆘 Troubleshooting

### Erro 403 (Forbidden)
- Verificar permissões do usuário
- Configurar token de acesso
- Verificar configuração do remote

### Erro de Merge
```bash
# Resolver conflitos
git pull origin main
git add .
git commit -m "Resolvendo conflitos"
git push origin main
```

### Reset Local
```bash
# Resetar para estado do GitHub
git fetch origin
git reset --hard origin/main
```

---

**💡 Dica**: Use o script `deploy.sh` para automatizar todo o processo!
