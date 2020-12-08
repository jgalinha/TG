#!/usr/bin/awk
###############################################################################
#                               words_table.awk                               #
# Autores: José Galinha, Luis Adriano #########################################
# Ficheiro para contar o numero de ocorrências de uma palavra num ficheiro ####
###############################################################################

BEGIN{
    RS="[ \n\t,.«»:)(;/?\"\"!]+";   
}

# Para ser considerada palavra tem de ser constituida por os caracteres indicados
# && nao conter dois travessoes seguidos 
( $0 ~ /[A-Za-z]+/ ) && ( $0 !~ /\-\-/) {
    palavra = tolower($0)
    if (length(palavra) > 1 ) {
        if( palavra in tabelaOcorrencias )
            tabelaOcorrencias[ palavra ] ++;
        else
            tabelaOcorrencias[ palavra ] = 1;
    }
}

END{
    for (palavra in tabelaOcorrencias)
        print palavra, tabelaOcorrencias[palavra];
}
