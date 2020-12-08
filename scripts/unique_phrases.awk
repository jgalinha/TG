#!/usr/bin/awk
# unique_phrases.awk
# Sun Dec  6 18:24:41 2020 

BEGIN{
    # Delimitadores de frases
    RS="[\n\t!?,:;..{3}]+";   
    frase = ""
}

{
    # Vamos eliminar todos os espaços brancos no inicio das linhas com o gsub
    gsub(/^[[:blank:]]+/,"",$0)
    #  Não conta todas as linhas que têm só uma palavra (não são frases!)
    if (NF > 1){
        # ciclo for para substituir os espaços na frase
        for (i = 1; i <= NF; i++){
            if (i > 1){
                frase = frase "|" $i
            } else {
                frase = $i
            }
        }
        if (frase in tabela)
            tabela[frase] ++;
        else
            tabela[frase] = 1;
    }
}

END{
    for (frase in tabela)
        print frase, tabela[frase]
}
