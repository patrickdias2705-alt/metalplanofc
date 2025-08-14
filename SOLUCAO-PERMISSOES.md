# 🔑 Solução para Problemas de Permissão - GitHub

## ❌ Problema Identificado

O token de acesso pessoal não está funcionando devido a problemas de permissões. Aqui estão as soluções:

## ✅ Soluções Recomendadas

### 1. **GitHub Desktop (Mais Fácil)**
```bash
# Baixar GitHub Desktop
# https://desktop.github.com/

# Clonar repositório via Desktop
# Fazer alterações
# Commit e Push via interface gráfica
```

### 2. **Token de Acesso Pessoal (Corrigir)**
1. **Acesse**: https://github.com/settings/tokens
2. **Revogue o token atual** (não está funcionando)
3. **Gere novo token** com escopo completo:
   - ✅ `repo` (acesso completo aos repositórios)
   - ✅ `workflow` (para GitHub Actions)
   - ✅ `admin:org` (se for organização)

### 3. **SSH Keys (Mais Seguro)**
```bash
# Gerar chave SSH
ssh-keygen -t ed25519 -C "seu-email@exemplo.com"

# Adicionar ao GitHub
# https://github.com/settings/keys

# Configurar remote SSH
git remote set-url origin git@github.com:adsdentech-web/metalplan.git
```

### 4. **Fork do Repositório**
```bash
# Fazer fork para sua conta
# https://github.com/adsdentech-web/metalplan

# Clonar seu fork
git clone https://github.com/SEU-USUARIO/metalplan.git

# Fazer alterações e push
git push origin main
```

## 🚀 Solução Temporária - Backup Local

### **Script de Backup Automático**
```bash
# Executar backup local
./backup-local.sh

# Isso cria um arquivo .tar.gz com timestamp
# Exemplo: backup-20250115-143022.tar.gz
```

### **Restaurar Backup**
```bash
# Extrair backup
tar -xzf backup-20250115-143022.tar.gz

# Copiar arquivos de volta
cp -r backup-20250115-143022/* .
```

## 🔧 Configuração Atual

### **Remote Configurado**
```bash
# Verificar remote atual
git remote -v

# Configurar para seu usuário
git remote set-url origin https://SEU-USUARIO:SEU-TOKEN@github.com/SEU-USUARIO/metalplan.git
```

### **Usuário Configurado**
```bash
# Configurar usuário local
git config user.name "SEU-USUARIO"
git config user.email "seu-email@exemplo.com"
```

## 📱 Alternativas para Sincronização

### 1. **GitHub CLI**
```bash
# Instalar GitHub CLI
brew install gh

# Autenticar
gh auth login

# Fazer push
gh repo sync
```

### 2. **Vercel/Netlify**
- Conectar repositório GitHub
- Deploy automático a cada push
- Sincronização em tempo real

### 3. **Dropbox/Google Drive**
- Sincronizar pasta do projeto
- Backup automático
- Versionamento manual

## 🎯 Próximos Passos

1. **Testar GitHub Desktop** (recomendado)
2. **Gerar novo token** com permissões corretas
3. **Configurar SSH** para acesso mais seguro
4. **Usar backup local** enquanto resolve permissões

## 📞 Suporte

Se o problema persistir:
- Verificar permissões da conta GitHub
- Contatar administrador da organização
- Usar backup local como solução temporária

---

**💡 Dica**: Use o script `backup-local.sh` para manter suas alterações seguras enquanto resolve as permissões!
