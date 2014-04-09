function [ y ] = rotNaVecF( agol1, n, org  )%codegen
    agol=deg2rad(agol1);
    nNorm=norm(n);
    pom=n./nNorm;
    n=pom; 

    M=[(n(1)^2)*(1-cos(agol))+cos(agol) n(1)*n(2)*(1-cos(agol))+n(3)*sin(agol) n(1)*n(3)*(1-cos(agol))-n(2)*sin(agol);
        n(1)*n(2)*(1-cos(agol))-n(3)*sin(agol) (n(2)^2)*(1-cos(agol))+cos(agol) n(2)*n(3)*(1-cos(agol))+n(1)*sin(agol);
        n(1)*n(3)*(1-cos(agol))+n(2)*sin(agol) n(2)*n(3)*(1-cos(agol))-n(1)*sin(agol) (n(3)^2)*(1-cos(agol))+cos(agol)];
    y=org*M;  
end