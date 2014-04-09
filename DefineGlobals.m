function [ ] = DefineGlobals(  )%codegen
%DEFINEGLOBALS Summary of this function goes here
%   Detailed explanation goes here
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
x=linspace(-50,50,5);
y=x;
[Xr,Yr]=meshgrid(x,y);
surf(Xr,Yr,0*Xr);
[X,Y,Z]=sphere(4);
bossCoords = [0 40 1];
bossMovement = [1 0 0];
inAir=0;
jumpDirection=0;
generatedObjects=0;
numberOfFriendsObjects=0;
numberOfLifeObjects=0;
generationDelay = 0;
SCORE=0;
LIFE = 3;
EnemySphere=struct('X',zeros(9,9),'Y',zeros(9,9),'Z',zeros(9,9),'C',zeros(1,3),'direction', 0);
ObjectsCoords=EnemySphere;
LifeObjectCoords = EnemySphere;
plane = struct('X',Xr,'Y',Yr,'Z',0*Xr);
n=[0 1 0]/norm([0 1 0]);
player=struct('Pmin',[1 0 0],'Pmax',[3 3 2],'Vulnerable',1,'direction',0);
cam=[-30,30,-30,70,4,26];
bossHealth = 100;
boolCollision = 0;
    x=linspace(-20,20,10);
    z=x;
    [Xb,Zb]=meshgrid(x,z);
    d=dot(player.Pmin,n);
    Yb=(-d-n(1)*Xb-n(3)*Zb)/n(2); 
    border=struct('X',Xb-4,'Y',Yb-4,'Z',Zb-4);
genobj=[-30,30,30,80,4,26];
friends=EnemySphere;
projectile(1,:)=[0 0 0];
end

