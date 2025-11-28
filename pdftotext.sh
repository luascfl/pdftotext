#!/bin/bash

# 1. Verifica se a ferramenta necessária está instalada
if ! command -v pdftotext &> /dev/null; then
    echo "❌ Erro: O comando 'pdftotext' não foi encontrado."
    echo "Instale rodando: sudo apt install poppler-utils"
    exit 1
fi

echo "📂 Verificando PDFs na pasta atual..."
encontrou_algum=false

# Habilita nullglob para o loop não rodar se não houver arquivos
shopt -s nullglob

# 2. Loop em todos os arquivos .pdf
for pdf in *.pdf; do
    encontrou_algum=true
    # Cria o nome do arquivo de saída trocando a extensão
    txt="${pdf%.pdf}.txt"

    # 3. Lógica de verificação
    if [ -f "$txt" ]; then
        echo "⏭️  [PULADO] Já existe: $txt"
    else
        echo "sc  [CONVERTENDO] $pdf..."
        # A flag -layout preserva a formatação visual
        pdftotext -layout "$pdf" "$txt"
        
        if [ $? -eq 0 ]; then
            echo "✅ Sucesso: $txt criado."
        else
            echo "⚠️  Falha ao converter: $pdf"
        fi
    fi
done

if [ "$encontrou_algum" = false ]; then
    echo "Nenhum arquivo PDF encontrado nesta pasta."
else
    echo "🏁 Processo finalizado."
fi
