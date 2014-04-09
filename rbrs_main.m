clear all;
clc;
hold on;
x=linspace(-50,50,5);
y=x;
[Xr,Yr]=meshgrid(x,y);
surf(Xr,Yr,0*Xr);
[X,Y,Z]=sphere(4);
surf(X,Y,Z+1);
camx=0;
camy=60;
Xs=X+20;
Ys=Y+20;
Zs=Z;
PlayerColor=[0 1 0];
%====================Definiranje na objekti====================
global generatedObjects; %broj na generirani objecti
global numberOfFriendsObjects; %broj na generirani frendoJ :)
global numberOfLifeObjects; % broj na generirani 'srcenca'
global SCORE; %SCORE
global LIFE;
global EnemySphere;
global ObjectsCoords;
global LifeObjectCoords;
global plane;
global player;
global cam;
global border;
global genobj;
global friends;
global inAir;
global jumpDirection;
global bossMovement
global generationDelay;
global bossCoords;
global projectile;
global bossHealth;
global boolCollision;
DefineGlobals();
%================= / definiranje na objekti ==================
% bossCoords = [0 40 1];
% bossMovement = [1 0 0];
% inAir=0;
% jumpDirection=0;
% generatedObjects=0;
% numberOfFriendsObjects=0;
% numberOfLifeObjects=0;
% generationDelay = 0;
% SCORE=0;
% LIFE = 3;
% EnemySphere=struct('X',[],'Y',[],'Z',[],'C',[],'direction', 0);
% ObjectsCoords=EnemySphere;
% LifeObjectCoords = EnemySphere;
% plane = struct('X',Xr,'Y',Yr,'Z',0*Xr);
% n=[0 1 0]/norm([0 1 0]);
% player=struct('X',X,'Y',Y,'Z',Z+1,'C',[0 0 1],'Vulnerable',1,'direction',0);
% cam=[-30,30,-30,70,4,26];
% bossHealth = 100;
% boolCollision = 0;
% x=linspace(-20,20,10);
%     z=x;
%     [Xb,Zb]=meshgrid(x,z);
%     d=dot([player.X(1,1),player.Y(1,1),player.Z(1,1)],n);
%     Yb=(-d-n(1)*Xb-n(3)*Zb)/n(2); 
% border=struct('X',Xb-4,'Y',Yb-4,'Z',Zb-4);
% genobj=[-30,30,30,80,4,26];
% friends=EnemySphere;
%=================  Menu  ==================

area(1, :) = [-25 0 21];
area(2, :) = [-25 0 16];
area(3, :) = [-25 0 11];
area(4, :) = [-25 0 6];

location = 1;
while 1
    hold on;
    axis(cam);
    view(0, 0)
    f = figure(1);
    found = 0;
    key = get(f, 'CurrentChar');
    
    if strcmp(key, 'w') && location ~= 1
        location = location - 1;
    elseif strcmp(key, 's') && location ~= 4
        location = location + 1;
    elseif strcmp(key, 'k')
        break;
    end
    
    set(f, 'CurrentChar', 'x');
    pmin = area(location, :);
    pmax = [area(location, 1)+ 50, area(location, 2) area(location, 3)+4];
    crtajOPOK(pmin, pmax, 'b', 2)
    
    text(cam(1)+10, cam(4) - 2, cam(6) - 3, 'Start Game', 'FontSize', 32, 'Color', [0 0 1]);
    text(cam(1)+10, cam(4) - 2, cam(6) - 8, 'Options', 'FontSize', 32, 'Color', [0 0 1]);
    text(cam(1)+10, cam(4) - 2, cam(6) - 13, 'Help', 'FontSize', 32, 'Color', [0 0 1]);
    text(cam(1)+10, cam(4) - 2, cam(6) - 18, 'Exit', 'FontSize', 32, 'Color', [0 0 1]);
    
    pause(0.1);
    a = ginput3d(1);
    a = abs(a);
 
    for i=1:4
        area(i, 3)
        if (area(i, 3)<= floor(a(3))) && (floor(a(3)) <= area(i, 3)+4 && area(i, 1)<= floor(a(1))) && (floor(a(1)) <= area(i, 1)+50) 
            location = i;
            found = 1;
            break;
        end
    end
    if found == 1
        break;
    end
    clf();
end
%================= / Menu ==================
if location == 1
    while 1
       hold on
       axis(cam);
       view(camx,camy);

       text(cam(2) - 17, cam(4) - 2, cam(6) - 2, ['SCORE: ', num2str(SCORE)], 'FontSize', 16, 'Color', [0 0 1]);
       sc=text(cam(2) - 28, cam(4) - 2, cam(6) - 2, ['Lifes: ', num2str(LIFE)], 'FontSize', 16, 'Color', [0 0 1]);
       
       if generationDelay == 0
           if length(ObjectsCoords)<8
               ObjectsCoords(end+1) = generateObjects(genobj ,8, 1);
           end
       else
           generationDelay = generationDelay - 10;
       end
       
       if length(friends) < 5
           friends(end+1) = generateObjects(genobj ,3, 0);
       end
        
       if length(LifeObjectCoords) < 3
           LifeObjectCoords(end+1) = generateObjects(genobj ,2, 2);
       end
 
       for i=2:length(ObjectsCoords)
           surf(ObjectsCoords(i).X,ObjectsCoords(i).Y,ObjectsCoords(i).Z); 
       end

       for i=2:length(friends)
          tempFr = surf(friends(i).X , friends(i).Y, friends(i).Z);
          set(tempFr,'FaceColor','yellow');
       end

       for i=2:length(LifeObjectCoords)
          tempFr = surf(LifeObjectCoords(i).X , LifeObjectCoords(i).Y, LifeObjectCoords(i).Z);
          set(tempFr,'FaceColor','red');
       end
       
       rbrs_move(); % go kontrolira dvizhenjeto na igrachot(levo-desno)
        surf(Xs,Ys,Zs);
        

       border.Y=border.Y+1;
       surf(plane.X,plane.Y,plane.Z);
      % surf(border.X,border.Y,border.Z);
       crtajOPOK(player.Pmin,player.Pmax,'g',2);

%        if(PlayerColor == [0 0 1])
%             set(pl,'FaceColor','green');
%             PlayerColor=[0 1 0];
%        else
%            set(pl,'FaceColor','blue');
%            PlayerColor=[0 0 1];
%        end

       genobj(3:4)=genobj(3:4)+1; % inkrementira koordinati za generiranje na novi objekti

        
       
       if(player.Vulnerable==0)
           
%             if(~isempty(projectile))
%                 disp('test11');
%                 if( presek_sfera_OPOK(projectile(1, :), projectile(2, :), player.C) == 1 )
%                    disp('test');
%                    projectile = [];
%                    boolCollision = 1;
%                 end
%             end;
            theEye();
            if(CheckCollision(1,player,1)==1)
                boolCollision = 1;
            end;
            
            if(boolCollision == 1)
                delete(sc);
               if(LIFE>1)
                   LIFE=LIFE-1;
                   text(cam(1)+3, cam(4) / 2, cam(6) / 2+17, ['YOU LOST A LIFE! ', num2str(LIFE) ' LIVES REMAINING!'], 'FontSize', 16, 'Color', [0 0 1]);
                   text(cam(2) - 28, cam(4) - 2, cam(6) - 2, ['Lifes: ', num2str(LIFE)], 'FontSize', 16, 'Color', [0 0 1]);
                   pause(3);
                   player.Vulnerable=player.Vulnerable+20;
               else
                   LIFE=LIFE-1;
                   text(cam(1)+3, cam(4) / 2, cam(6) / 2+17, ['GAME OVER! SCORE: ', num2str(SCORE) '! Try again!'], 'FontSize', 16, 'Color', [0 0 1]);
                   text(cam(2) - 28, cam(4) - 2, cam(6) - 2, ['Lifes: ', num2str(LIFE)], 'FontSize', 16, 'Color', [0 0 1]);
                   disp('BOOM! Game Over!');
                   break;
               end
               
               boolCollision = 0;
            end
       else
           player.Vulnerable=player.Vulnerable-1;
         %  set(pl,'FaceColor','red');
           PlayerColor=[1 1 0];
       end;

       ObjectsCoords = moveObjects(ObjectsCoords);
       CheckCollision(1,player,1); %proverka so sirenca
       CheckCollision(1,player,2); %proverka so srcenca

       

       pause(0.01);
        
       [ObjectsCoords, generatedObjects] = rbrs_Destroy(ObjectsCoords, generatedObjects);
       [friends, numberOfFriendsObjects] = rbrs_Destroy(friends, numberOfFriendsObjects);
       [LifeObjectCoords, numberOfLifeObjects] = rbrs_DestroyLifeObject(LifeObjectCoords, numberOfLifeObjects);
       clf();
    end
elseif location == 3
    clf();
    hold on;
    axis([-5,30,-30,70,-10,10]);
    view(0, 0);
    text( 5, 3, 7, 'HELP!', 'FontSize', 32, 'Color', [0 0 1]);
    [X Y Z] = sphere(2);
    tempFr = surf(X , Y, Z,'FaceColor','yellow');
    text( 2, 0, 0, 'Zlato', 'FontSize', 16, 'Color', [0 0 1]);
    
    [Xz Yz Zz] = sphere(2);
    Yz = Yz + 3;
    Zz = Zz + 3;
    surf(Xz , Yz, Zz,'FaceColor','red');
    text( 2, 3, 3, 'Zivoti', 'FontSize', 16, 'Color', [0 0 1]);
    
    [Xz Yz Zz] = sphere(8);
    Yz = Yz - 3;
    Zz = Zz - 3;
    surf(Xz , Yz, Zz);
    text( 2, 3, -3, 'Neprijateli', 'FontSize', 16, 'Color', [0 0 1]);
    
    [Xz Yz Zz] = sphere(8);
    [Xoko Yoko Zoko] = sphere(8);
    Xz = Xz * 4;
    Zz = Zz * 1.5;
    Zoko = Zoko * 1.5;

    Xz = Xz + 15;
    Xoko = Xoko+15;
    Yoko = Yoko-1;
    surf(Xz, Yz, Zz, 'FaceColor', [1 0 0]);
    surf(Xoko, Yoko, Zoko, 'FaceColor', [0 0 0]);
    text( 19.5, 4, 0, 'Boss', 'FontSize', 22, 'Color', [0 0 1]);
elseif location == 4
    close
end
    
