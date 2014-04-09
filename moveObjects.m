function [ ObjectsCoords ] = moveObjects( ObjectsCoords )%codegen

limit=length(ObjectsCoords);
i=2;
if(limit>2)
    while i<=limit
       ObjectsCoords(i) = moveObject(ObjectsCoords(i));
       i=i+1;
    end
end

end

