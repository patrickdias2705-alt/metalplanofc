#!/bin/bash

# Script de Sincronização Automática em Tempo Real - Metalplan
echo "🚀 Iniciando sincronização automática..."

# Verificar se há alterações
if [[ -n $(git status --porcelain) ]]; then
    echo "📝 Alterações detectadas, fazendo commit..."
    
    # Adicionar todas as alterações
    git add .
    
    # Fazer commit com timestamp
    git commit -m "Auto-sync: $(date '+%Y-%m-%d %H:%M:%S') - Metalplan"
    
    # Fazer push para o GitHub
    echo "📤 Enviando para o GitHub..."
    if git push origin main; then
        echo "✅ Sincronização realizada com sucesso!"
        echo "🌐 Acesse: https://github.com/adsdentech-web/metalplan"
        
        # Mostrar status atual
        echo ""
        echo "📊 Status atual:"
        git status --porcelain
    else
        echo "❌ Erro na sincronização!"
        echo "💡 Verifique o token de acesso"
    fi
else
    echo "✅ Nenhuma alteração detectada"
    echo "📊 Status atual:"
    git status
fi

echo "🏁 Sincronização finalizada!"
