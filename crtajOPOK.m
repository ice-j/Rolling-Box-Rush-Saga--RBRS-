function [  ] = crtajOPOK( pmin, pmax, b, size )%codegen
	Tocka1 = [ pmin(1), pmin(2), pmin(3) ];
	Tocka2 = [ pmax(1), pmin(2), pmin(3) ];
	Tocka3 = [ pmax(1), pmax(2), pmin(3) ];
	Tocka4 = [ pmin(1), pmax(2), pmin(3) ];
	Tocka5 = [ pmax(1), pmin(2), pmax(3) ];
	Tocka6 = [ pmin(1), pmin(2), pmax(3) ];
	Tocka7 = [ pmin(1), pmax(2), pmax(3) ];
	Tocka8 = [ pmax(1), pmax(2), pmax(3) ];

	plot3([Tocka1(1), Tocka2(1)], [Tocka1(2), Tocka2(2)], [Tocka1(3), Tocka2(3)], b, 'LineWidth', size);
	plot3([Tocka2(1), Tocka3(1)], [Tocka2(2), Tocka3(2)], [Tocka2(3), Tocka3(3)], b, 'LineWidth', size);
	plot3([Tocka3(1), Tocka4(1)], [Tocka3(2), Tocka4(2)], [Tocka3(3), Tocka4(3)], b, 'LineWidth', size);
	plot3([Tocka4(1), Tocka1(1)], [Tocka4(2), Tocka1(2)], [Tocka4(3), Tocka1(3)], b, 'LineWidth', size);

	plot3([Tocka1(1), Tocka6(1)], [Tocka1(2), Tocka6(2)], [Tocka1(3), Tocka6(3)], b, 'LineWidth', size);
	plot3([Tocka2(1), Tocka5(1)], [Tocka2(2), Tocka5(2)], [Tocka2(3), Tocka5(3)], b, 'LineWidth', size);
	plot3([Tocka3(1), Tocka8(1)], [Tocka3(2), Tocka8(2)], [Tocka3(3), Tocka8(3)], b, 'LineWidth', size);
	plot3([Tocka4(1), Tocka7(1)], [Tocka4(2), Tocka7(2)], [Tocka4(3), Tocka7(3)], b, 'LineWidth', size); 

	plot3([Tocka5(1), Tocka6(1)], [Tocka5(2), Tocka6(2)], [Tocka5(3), Tocka6(3)], b, 'LineWidth', size);
	plot3([Tocka6(1), Tocka7(1)], [Tocka6(2), Tocka7(2)], [Tocka6(3), Tocka7(3)], b, 'LineWidth', size);
	plot3([Tocka7(1), Tocka8(1)], [Tocka7(2), Tocka8(2)], [Tocka7(3), Tocka8(3)], b, 'LineWidth', size);
	plot3([Tocka8(1), Tocka5(1)], [Tocka8(2), Tocka5(2)], [Tocka8(3), Tocka5(3)], b, 'LineWidth', size);
end

