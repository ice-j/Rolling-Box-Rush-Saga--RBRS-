function [ y ] = proekcija3dnFunk(org, n, k)%codegen
    M=[1+(k-1)*n(1)^2 (k-1)*n(1)*n(2) (k-1)*n(1)*n(3)
       (k-1)*n(1)*n(2) 1+(k-1)*n(2)^2 (k-1)*n(2)*n(3)
       (k-1)*n(1)*n(3) (k-1)*n(2)*n(3) 1+(k-1)*n(3)^2] ;
    y=org*M;
end