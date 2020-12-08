#!/usr/bin/awk
###############################################################################
#                            count_unique_words.awk                           #
# Autores: José Galinha, Luis Adriano #########################################
# Ficheiro para contar as palavras unicas num ficheiro de texto ###############
###############################################################################

BEGIN{
    RS="[ \n\t,.«»:)(;/?\"!]+";   
}

# Para ser considerada palavra tem de ser constituida por os caracteres indicados
# && nao conter dois travessoes seguidos 
( $0 ~ /[-A-Za-z]+/ ) && ( $0 !~ /\-\-/) {
    palavra = tolower($0)
    if (length(palavra) > 1) {
        if( palavra in tabelaOcorrencias )
            tabelaOcorrencias[ palavra ] ++;
        else
            tabelaOcorrencias[ palavra ] = 1;
    }
}

END{
    print length(tabelaOcorrencias)
}
