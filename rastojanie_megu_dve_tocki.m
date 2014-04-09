% Programata bara rastojanie megu dve tocki

% Vlezni parametri:
%   x,y-koordinati na dvete tocki (vektori)
%
% Izlezni parametri:
%   rastojanie-rastojanieto megu dvete tocki

function [ rastojanie ] = rastojanie_megu_dve_tocki( x,y )%codegen
    rastojanie=norm(y-x);
end

