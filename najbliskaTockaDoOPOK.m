function [ Q ] = najbliskaTockaDoOPOK( Min,Max,Q )%codegen
    for i=1:3
      if (Q(i)<Min(i))
        Q(i)=Min(i);
       else if(Q(i)>Max(i))
        Q(i)=Max(i);
           end
      end
    end
end

