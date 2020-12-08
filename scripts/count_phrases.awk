#!/usr/bin/awk
# count_phrases.awk

BEGIN{
    # Delimitadores de frases
    RS="[\n\t!?,:;..{3}]+";   
    z=0;
}

{
    # Vamos eliminar todos os espaços brancos no inicio das linhas com o gsub
    gsub(/^[[:blank:]]+/,"",$0)
    # Com este if estamos a expluir todas as linhas que só têm uma palavra
    if (NF > 1) {
        z++;
    }
}

END{
    print z
}
