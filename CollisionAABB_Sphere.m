function [ bool ] = CollisionAABB_Sphere( pmin,pmax,c )
%COLLISIONAABB_SPHERE Summary of this function goes here
%   Detailed explanation goes here
point=c;
if (point(1) < pmin(1)) 
point(1) = pmin(1);
else
point(1) = pmax(1);
end

if (point(2) < pmin(2)) 
point(2) = pmin(2);   
else
point(2) = pmax(2);
end

if (point(3) < pmin(3))
point(3) = pmin(3);
else
point(3) = pmax(3);
end


bool=0;
if(rastojanie_megu_dve_tocki(point,c) < 2)
   bool=1; 
end
end

