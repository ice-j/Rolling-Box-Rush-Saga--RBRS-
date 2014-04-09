function [] = theEye(  )%codegen

    global bossMovement bossCoords genobj projectile cam bossHealth;
    
    [X, Y, Z] = sphere(8);

    if (bossCoords(1) >= genobj(2) - randi([0 25]))
        bossMovement = [-1 0 0];
    elseif (bossCoords(1) <= genobj(1) + randi([0 25]))
        bossMovement = [1 0 0];
    end
    
    [Xoko, Yoko, Zoko] = sphere(5);

    X = X * 4;

    Yoko = Yoko-0.5;
    Yoko = Yoko * 2;
   
    
    Xoko = Xoko + bossCoords(1) + bossMovement(1);
    Yoko = Yoko + bossCoords(2) + 1;
    Zoko = Zoko + bossCoords(3);
    
    X = X + bossCoords(1) + bossMovement(1);
    Y = Y + bossCoords(2) + 1;
    Z = Z + bossCoords(3);
    
    bossCoords(1) = bossCoords(1) + bossMovement(1);
    bossCoords(2) = bossCoords(2) + 1;
    if bossHealth > 0
        if (length(projectile) < 8) 
%              projectile(1, :) = [ bossCoords(1) + 2, bossCoords(2) - 1, 1 ];
%              projectile(2, :) = [ bossCoords(1) - 1, bossCoords(2) - 5, 3 ];
               projectile(end+1,:)=[bossCoords(1),bossCoords(2),2];            
        end
    end
  
    
    hold on
    if bossHealth > 0
        surf(X, Y, Z, 'FaceColor', [1 0 0])
        surf(Xoko, Yoko, Zoko, 'FaceColor', [0 0 0]);
    end
    
    for i=2:(size(projectile))(1)
       plot3([projectile(i,1) projectile(i,1)],[projectile(i,2) projectile(i,2)-5],[2 2],'LineWidth',2);
    end
end