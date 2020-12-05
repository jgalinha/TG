#!/usr/bin/awk
# count_phrases.awk

BEGIN{
    # Delimitadores de frases
    RS="[\n\t!?,:;..{3}]+";   
}

# Verifica se a frase começa por uma letra ou mais e são começa por um ou mais
# espaço ou TAB
( $0 ~ /^[A-Za-z]+/) && ($0 !~ /^[  \t]+/){
    # Não conta todas as linhas que têm só uma letra (não são frases!)
    if (length($0) > 1){
        if ($0 in tabela)
            tabela[$0] ++;
        else
            tabela[$0] = 1;
    }
}

END{
    print length(tabela)
}
