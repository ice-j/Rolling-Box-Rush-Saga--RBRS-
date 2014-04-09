% obj
function [ obj ] = moveObject( obj )%codegen

if(obj.direction == 1) % move -1 -1a
    obj.X = obj.X - 1;
    obj.Y = obj.Y - 1;
    obj.C(1) = obj.C(1) - 1;
    obj.C(2) = obj.C(2) - 1;
    
elseif(obj.direction == 2 ) % move 0 -1
    obj.Y = obj.Y - 1;
    obj.C(2) = obj.C(2) - 1;

elseif(obj.direction == 3 ) % move -1 +1
    obj.X = obj.X + 1;
    obj.Y = obj.Y - 1;
    obj.C(1) = obj.C(1) + 1;
    obj.C(2) = obj.C(2) - 1;
else % DONT MOVE!!! 

end   

end

