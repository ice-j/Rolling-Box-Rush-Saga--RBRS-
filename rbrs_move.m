function [] =rbrs_move()%codegen
global player plane cam genobj inAir jumpDirection ObjectsCoords EnemySphere generationDelay;
   f=figure(1);
   key=get(f,'CurrentChar');

   if strcmp(key,'l')
          rbrs_laser();
   end
   
   if strcmp(key,'j')
          inAir = 1;
   end
   
   if strcmp(key,'c')
          ObjectsCoords = EnemySphere;
          generationDelay = 200; 
   end
   if strcmp(key,'a')
      player.Pmin(1)=player.Pmin(1)-1;
      player.Pmax(1)=player.Pmax(1)-1;
      player.Pmin(2)=player.Pmin(2)+1;
      player.Pmax(2)=player.Pmax(2)+1;
      cam(1:2)=cam(1:2)-1;
      cam(3:4)=cam(3:4)+1;
      plane.X=plane.X-1;
      plane.Y=plane.Y+1;
      genobj(1:2)=genobj(1:2)-1;
      player
   elseif strcmp(key,'d')
      player.Pmin(1)=player.Pmin(1)+1;
      player.Pmax(1)=player.Pmax(1)+1;
      player.Pmin(2)=player.Pmin(2)+1;
      player.Pmax(2)=player.Pmax(2)+1;
      cam(1:2)=cam(1:2)+1;
      cam(3:4)=cam(3:4)+1;
      plane.X=plane.X+1;
      plane.Y=plane.Y+1;
      genobj(1:2)=genobj(1:2)+1;
      player
   else
       cam(3:4)=cam(3:4)+1;
       plane.Y=plane.Y+1;
       player.Pmin(2)=player.Pmin(2)+1;
       player.Pmax(2)=player.Pmax(2)+1;
       
   end
   
   %Presek OPOK i sfera
   if inAir == 1
       if jumpDirection == 1
           player.Z = player.Z - 1;
           player.C(3) = player.C(3) - 1;
       else
           player.Z = player.Z + 1;
           player.C(3) = player.C(3) + 1;
       end
       
       if player.C(3) >= 6
           jumpDirection = 1;
       elseif player.C(3) == 1
           inAir = 0;
           jumpDirection = 0;
       end
   end
   set(f,'CurrentChar','e');
end