function [ ObjectsCoords, generatedObjects ] = rbrs_Destroy(ObjectsCoords, generatedObjects)%codegen

global border projectile
limit=length(ObjectsCoords);
i=2;
n=[0 1 0]/norm([0 1 0]);
if(limit>2)
    while i<=limit
        
        if(checkObjectSidePlane([border.X(1,1) border.Y(1,1) border.Z(1,1)],...
            [ObjectsCoords(i).X(1,1), ObjectsCoords(i).Y(1,1), ObjectsCoords(i).Z(1,1)],n))
            [ObjectsCoords, generatedObjects] = removeElementByIndex( ObjectsCoords, generatedObjects, i );
            limit=limit-1;
           % if ObjectsCoords(i).X ~= zeros(length(ObjectsCoords(i).X))
           %     generatedObjects = generatedObjects - 1;

           %     if(i==1)
             %       ObjectsCoords=ObjectsCoords(2:limit);
            %    elseif i==limit
             %       ObjectsCoords=ObjectsCoords(1:limit-1);
             %   else
             %      temp1=ObjectsCoords(i+1:limit);
             %       ObjectsCoords=ObjectsCoords(1:i-1);
             %       ObjectsCoords(i:limit-1)=temp1;
             %   end
             %   limit=limit-1;
           % end
        end
        i=i+1;
    end
end
sz=size(projectile);
i=1;
while(true)
   if(i>sz(1))
      break; 
   end
   if(checkObjectSidePlane([border.X(1,1) border.Y(1,1) border.Z(1,1)],projectile(i,:),n))
      projectile=projectile([1:i-1,i+1:end],:); 
      sz=size(projectile);
   end
   i=i+1;
end
end

