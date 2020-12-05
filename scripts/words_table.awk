#!/usr/bin/awk
# Autores: José Galinha, Luis Adriano
# 
#  words_table.awk

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
