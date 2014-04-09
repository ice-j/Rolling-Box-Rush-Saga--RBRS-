% Generirajne na random tocka vo prostorot so daden opseg
% vector v[xmin xmax ymin ymax zmin zmax]
function [ this ] = generate3DPoint( this, v )%codegen
    x = randi([v(1) v(2)]);
    y = randi([v(3) v(4)]);
    this.X = this.X+x;
    this.Y = this.Y+y;
    this.C=[x y 1];
    
    while (CheckCollision(0,this,1)==1)
        x = randi([v(1) v(2)]);
        y = randi([v(3) v(4)]);
        this.X=this.X+x;
        this.Y=this.Y+y;
        this.C=[x y 1];
    end
end

