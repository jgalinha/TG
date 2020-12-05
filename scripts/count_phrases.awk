#!/usr/bin/awk
# count_phrases.awk

BEGIN{
    # Delimitadores de frases
    RS="[\n\t!?,:;..{3}]+";   
    z=0;
}

# Verifica se a frase começa por uma letra ou mais e são começa por um ou mais
# espaço ou TAB
( $0 ~ /^[A-Za-z]+/) && ($0 !~ /^[  \t]+/){

    #$0.gsub(/^[ \t]+|[ \t]+$/, "")
    z++;
}

END{
    print z
}
