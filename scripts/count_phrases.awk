#!/usr/bin/awk
###############################################################################
#                              count_phrases.awk                              #
# Autores: José Galinha, Luis Adriano #########################################
# Ficheiro para contar as frases de um ficheiro de texto ######################
###############################################################################

BEGIN{
    # Delimitadores de frases
    RS="[\n\t!?,:;..{3}]+";   
    z=0;
}

{
    # Vamos eliminar todos os espaços brancos no inicio das linhas com o gsub
    gsub(/^[[:blank:]]+/,"",$0)
    # Com este if estamos a garantir que não contamos linhas vazias
    if (NF > 0) {
        z++;
    }
}

END{
    print z
}
