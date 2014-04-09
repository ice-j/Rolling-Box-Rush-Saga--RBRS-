function [ bool ] = staticen_test_dve_sferi( c1,c2,r1,r2 )%codegen
bool=0;
  pom=c2-c1;
  d=dot(pom,pom);
  %Sferite se dopiraat ako
  if(d<=(r1+r2)^2)
      bool=1;
  end
end