function [ izlez ] = presek_sfera_OPOK( Pmin,Pmax,c )%codegen
    tocka = najbliskaTockaDoOPOK( Pmin,Pmax, c );
    dolzina = rastojanie_megu_dve_tocki( c,tocka );
    disp(dolzina);
    
    if dolzina <= 4
        izlez = 1;
    else
        izlez = 0;

    end
end