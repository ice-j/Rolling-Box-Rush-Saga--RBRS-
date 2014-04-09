function [ this ] = generateObjects( v ,sphereNum, directionRandi)%codegen % directionTpe = 1 for rand 0 for 0;

[Xx1,Yy1,Zz1]=sphere(sphereNum);

if(directionRandi == 1)
    direction = randi([1 3]);
elseif(directionRandi == 2)
    direction = randi([10000 15000]);
else
    direction = 0;
end

structEnemies = struct(...
   'X',Xx1,...
   'Y',Yy1,...
   'Z',Zz1+1,...
   'C',[],...
   'direction', direction ...
   );

this = structEnemies;
this = generate3DPoint( this, v );

end

