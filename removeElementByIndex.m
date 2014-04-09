function [ ObjectsCoords, generatedObjects ] = removeElementByIndex( ObjectsCoords, generatedObjects, i )%codegen
    limit=length(ObjectsCoords);
    if  i > 0 && limit > 0
            generatedObjects = generatedObjects - 1;

                    if(i==1)
                        ObjectsCoords=ObjectsCoords(2:limit);
                    elseif i==limit
                        ObjectsCoords=ObjectsCoords(1:limit-1);
                    else
                        temp1=ObjectsCoords(i+1:limit);
                        ObjectsCoords=ObjectsCoords(1:i-1);
                        ObjectsCoords(i:limit-1)=temp1;
                    end
     end


end

