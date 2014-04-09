function [ ] = rbrs_laser()%codegen
    global player SCORE bossCoords bossHealth;
    lx=(player.Pmax(1)+player.Pmin(1))/2;
    ly=(player.Pmax(2)+player.Pmin(2))/2;
    lz=(player.Pmax(3)+player.Pmin(3))/2;
    %plot3([player.C(1) player.C(1)], [player.C(2) player.C(2)+50], [player.C(3) player.C(3)],'LineWidth',5);
    plot3([lx lx],[ly ly+50],[lz lz],'LineWidth',5);
    
    global ObjectsCoords;
    global generatedObjects;
    lengthVar = length(ObjectsCoords);
    i = 2;
    while i <= lengthVar
         ob(1) = ObjectsCoords(i).C(1);
         ob(3) = ObjectsCoords(i).C(3);
         
         if ((ob(1) >= lx-1 && ob(1) <= lx+1 ) && (ob(3) == lz))
           [ObjectsCoords, generatedObjects] = removeElementByIndex( ObjectsCoords, generatedObjects, i );
           lengthVar = lengthVar-1;
           SCORE = SCORE+1;
         end
         i=i+1;
    end
    
    if ((bossCoords(1) >= lx-4 && bossCoords(1) <= lx+4 ) && (bossCoords(3) == lz))
        bossHealth = bossHealth - randi([10 15]);
    end
end

