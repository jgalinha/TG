#!/usr/bin/awk
###############################################################################
#                                word_pairs.awk                               #
# Autores: José Galinha, Luis Adriano                                         #
###############################################################################

BEGIN{
}
# Exclui todas as palavras que estão sozinhas
(NF > 1){
    # Ciclo inicia em dois pois começamos por escolher a (x-1) palavras
    for (x = 2; x <= NF; x++) {
        # Verifica se o $x tem mais de uma letra para ser considerado palavra
        if (length($x) > 1) {
            par = tolower($(x-1) " " $x)
            if (par in tabelaPares){
                tabelaPares[par]++;
            } else {
                tabelaPares[par] = 1;
            }
        } else {
            # Aumenta o valor do x para não fazer par com letras isoladas
            x++
        }
    }
}
END {
    # Imprime para o ecrâ a tabela de pares
    for (par in tabelaPares){
        print par, tabelaPares[par]
    }
}
