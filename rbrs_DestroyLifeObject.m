function [ ObjectsCoords, generatedObjects ] = rbrs_DestroyLifeObject(ObjectsCoords, generatedObjects)%codegen

global border 
limit=length(ObjectsCoords);
i=2;
if(limit>2)
    while i<=limit
        n=[0 1 0]/norm([0 1 0]);
        T=[ObjectsCoords(i).X(1,1) ObjectsCoords(i).Y(1,1) ObjectsCoords(i).Z(1,1)];

        if(checkObjectSidePlane([border.X(1,1) border.Y(1,1) border.Z(1,1)],T,n))
            [ObjectsCoords, generatedObjects] = removeElementByIndex( ObjectsCoords, generatedObjects, i );
            limit=limit-1;
        elseif( ObjectsCoords(i).direction < 0 )
            [ObjectsCoords, generatedObjects] = removeElementByIndex( ObjectsCoords, generatedObjects, i );
            limit=limit-1;
        else
            ObjectsCoords(i).direction = ObjectsCoords(i).direction - randi([1 3]);
        end
        i=i+1;
    end
end
end