#!/usr/bin/awk
# count_phrases.awk

BEGIN{
    # Delimitadores de frases
    RS="[\n\t!?,:;..{3}]+";   
}

{
    # Vamos eliminar todos os espaços brancos no inicio das linhas com o gsub
    gsub(/^[[:blank:]]+/,"",$0)
    #  Não conta todas as linhas que têm só uma letra (não são frases!)
    if (NF > 1){
        if ($0 in tabela)
            tabela[$0] ++;
        else
            tabela[$0] = 1;
    }
}

END{
    print length(tabela)
}
