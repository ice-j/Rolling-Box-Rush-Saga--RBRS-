function [ ret ] = checkObjectSidePlane( TockaODRamninata, CentarNaObjectVec, n )%codegen

    ret = false;
    n = n/norm(n);

    d = dot(TockaODRamninata,n);
    proekcijaVrzRamnina = proekcija3dnFunk(CentarNaObjectVec,n,0);
    baranaTocka = proekcijaVrzRamnina + n*d;
    vecRamninaDoTocka = CentarNaObjectVec - baranaTocka;

    if(dot(vecRamninaDoTocka,n)<0)
        ret = true;
    end

end

