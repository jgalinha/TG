#!/usr/bin/awk

BEGIN{
    RS="[ \n\t,.«»:)(;/?\"!]+";   
    i=0;
}

# Para ser considerada palavra tem de ser constituida por os caracteres indicados
# && nao conter dois travessoes seguidos 
( $0 ~ /^[-A-Za-záéíóúÁÉÍÓÚàÀâÂêÊôÔãÃõÕçÇ]+$/ ) && ( $0 !~ /\-\-/) {
    i++;
}

END{
    print i
}
