#!/usr/bin/awk
###############################################################################
#                           count_unique_phrases.awk                          #
# Autores: José Galinha, Luis Adriano #########################################
# Ficheiro para contar as frases unicas num ficheiro de texto ################# 
###############################################################################

BEGIN{
    # Delimitadores de frases
    RS="[\n\t!?,:;..{3}]+";   
}

{
    # Vamos eliminar todos os espaços brancos no inicio das linhas com o gsub
    gsub(/^[[:blank:]]+/,"",$0)
    #  Com este IF estamos a garantir que não contamos linhas vazias
    if (NF > 0){
        if ($0 in tabela)
            tabela[$0] ++;
        else
            tabela[$0] = 1;
    }
}

END{
    print length(tabela)
}
