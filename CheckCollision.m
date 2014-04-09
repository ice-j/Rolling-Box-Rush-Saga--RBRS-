function [ bool ] = CheckCollision(withplayer, obj , checkFriends ) %codegen

global ObjectsCoords;
global friends;
global LifeObjectCoords;
global numberOfFriendsObjects;
global numberOfLifeObjects;
global SCORE;
global LIFE;
coder.inline('never');
bool=0;
if withplayer==1
    for i=2:length(ObjectsCoords)
       if(CollisionAABB_Sphere(obj.Pmin,obj.Pmax,ObjectsCoords(i).C)==1)
          bool=1;
          if (length(obj)==1)
               bool = 1;
          end;
          break;
       end
    end

    if (bool ~= 1 && checkFriends == 1)
        for i=2:length(friends)

           if(CollisionAABB_Sphere(obj.Pmin,obj.Pmax,friends(i).C)==1)
              [friends, numberOfFriendsObjects ] = removeElementByIndex( friends, numberOfFriendsObjects, i );
              if (length(obj)==1)
                SCORE=SCORE+1;
              end;

              break;
           end
        end
    end

    if (bool ~= 1 && checkFriends == 2)
        for i=2:length(LifeObjectCoords)
           if(CollisionAABB_Sphere(obj.Pmin,obj.Pmax,LifeObjectCoords(i).C)==1)
              [LifeObjectCoords, numberOfLifeObjects ] = removeElementByIndex( LifeObjectCoords, numberOfLifeObjects, i );
                  if (length(obj)==1)
                    LIFE=LIFE+1;
                  end;

              break;
           end
        end
    end
else
    for i=2:length(ObjectsCoords)
       if(staticen_test_dve_sferi(ObjectsCoords(i).C,obj.C,1,1)==1)
          bool=1;
          if (length(obj)==1)
               bool = 1;
          end;
          break;
       end
    end

    if (bool ~= 1 && checkFriends == 1)
        for i=2:length(friends)

           if(staticen_test_dve_sferi(friends(i).C,obj.C,1,1)==1)
              [friends, numberOfFriendsObjects ] = removeElementByIndex( friends, numberOfFriendsObjects, i );
              if (length(obj)==1)
                SCORE=SCORE+1;
              end;

              break;
           end
        end
    end

    if (bool ~= 1 && checkFriends == 2)
        for i=2:length(LifeObjectCoords)
           if(staticen_test_dve_sferi(LifeObjectCoords(i).C,obj.C,1,1)==1)
              [LifeObjectCoords, numberOfLifeObjects ] = removeElementByIndex( LifeObjectCoords, numberOfLifeObjects, i );
                  if (length(obj)==1)
                    LIFE=LIFE+1;
                  end;

              break;
           end
        end
    end
end
end

