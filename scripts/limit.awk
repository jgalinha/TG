#!/usr/bin/awk
###############################################################################
#                               pair_phrases.awk                              #
# Autores: José Galinha, Luis Adriano #########################################
# Script para limitar o numero de linhas dos ficheiros txt                    # 
###############################################################################

BEGIN{
    i = 0
}

(i < limit) {
    print $0
    i++
}

END{
}
