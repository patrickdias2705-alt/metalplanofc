#!/bin/bash

# Script de Deploy Automático para Metalplan
echo "🚀 Iniciando deploy automático..."

# Verificar status do Git
echo "📊 Verificando status do Git..."
git status

# Adicionar todas as alterações
echo "➕ Adicionando alterações..."
git add .

# Fazer commit com timestamp
echo "💾 Fazendo commit..."
git commit -m "Auto-update: $(date '+%Y-%m-%d %H:%M:%S') - Metalplan"

# Fazer push para o GitHub
echo "📤 Enviando para o GitHub..."
git push origin main

# Verificar resultado
if [ $? -eq 0 ]; then
    echo "✅ Deploy realizado com sucesso!"
    echo "🌐 Acesse: https://github.com/adsdentech-web/metalplan"
else
    echo "❌ Erro no deploy. Verifique as permissões."
    echo "💡 Dica: Configure um token de acesso pessoal no GitHub"
fi

echo "🏁 Deploy finalizado!"
