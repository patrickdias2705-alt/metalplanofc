#!/bin/bash

# Script de Backup Local para Metalplan
echo "💾 Iniciando backup local..."

# Criar pasta de backup com timestamp
BACKUP_DIR="backup-$(date '+%Y%m%d-%H%M%S')"
mkdir -p "$BACKUP_DIR"

# Copiar arquivos principais
echo "📁 Copiando arquivos..."
cp -r *.html "$BACKUP_DIR/"
cp -r *.css "$BACKUP_DIR/"
cp -r *.js "$BACKUP_DIR/"
cp -r *.png "$BACKUP_DIR/"
cp -r *.jpeg "$BACKUP_DIR/"
cp -r *.md "$BACKUP_DIR/"
cp -r *.sh "$BACKUP_DIR/"

# Criar arquivo de informações do backup
echo "📝 Criando informações do backup..."
cat > "$BACKUP_DIR/BACKUP-INFO.txt" << EOF
Backup Metalplan - $(date '+%Y-%m-%d %H:%M:%S')

Arquivos incluídos:
- HTML: $(ls *.html 2>/dev/null | wc -l | tr -d ' ')
- CSS: $(ls *.css 2>/dev/null | wc -l | tr -d ' ')
- JavaScript: $(ls *.js 2>/dev/null | wc -l | tr -d ' ')
- Imagens: $(ls *.png *.jpeg 2>/dev/null | wc -l | tr -d ' ')
- Documentação: $(ls *.md 2>/dev/null | wc -l | tr -d ' ')
- Scripts: $(ls *.sh 2>/dev/null | wc -l | tr -d ' ')

Status do Git:
$(git status --porcelain 2>/dev/null || echo "Git não configurado")

Último commit:
$(git log --oneline -1 2>/dev/null || echo "Nenhum commit encontrado")

Para restaurar:
1. Copie os arquivos de volta para a pasta principal
2. Execute: git add . && git commit -m "Restaurando backup"
EOF

# Comprimir backup
echo "🗜️ Comprimindo backup..."
tar -czf "$BACKUP_DIR.tar.gz" "$BACKUP_DIR"

# Remover pasta temporária
rm -rf "$BACKUP_DIR"

echo "✅ Backup criado: $BACKUP_DIR.tar.gz"
echo "📊 Tamanho: $(du -h "$BACKUP_DIR.tar.gz" | cut -f1)"
echo "💡 Para restaurar: tar -xzf $BACKUP_DIR.tar.gz"

# Listar backups disponíveis
echo ""
echo "📋 Backups disponíveis:"
ls -la backup-*.tar.gz 2>/dev/null | head -5

echo "🏁 Backup finalizado!"
