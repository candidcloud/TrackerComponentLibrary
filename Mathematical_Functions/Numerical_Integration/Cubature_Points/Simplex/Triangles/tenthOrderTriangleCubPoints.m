function [xi,w]=tenthOrderTriangleCubPoints()
%%TENTHORDERTRIANGLECUBPOINTS Obtain tenth-order cubature points for
%   integration over a triangle in 2D. The points and weights are for the
%   triangle with vertices (1,0), (0,1), (0,0), but can be transformed to
%   any triangle using transformSimplexTriPoints.
%
%INPUTS: None
%
%OUTPUTS: xi A 2XnumCubPoints set of points for the standard triangle.
%          w A 1XnumCubPoints set of cubature weights. This sums to the
%            volume of the triangle (1/2).
%
%This function implements the points given in [1] (25 points).
%
%EXAMPLE:
%Given the vertices of the simplex, we compare a tenth-order moment
%computed using these cubature points to one computed using
%monomialIntSimplex. The results are the same within typical finite
%precision limits.
% [xi,w]=tenthOrderTriangleCubPoints();
% alpha=[6;4];
% theMoment=findMomentFromSamp(alpha,xi,w)
% intVal=monomialIntSimplex(alpha)
%
%REFERENCES:
%[1] F. D. Witherden and P. E. Vincent, "On the identification of symmetric
%    quadrature rules for finite element methods," Computer and Mathematics
%    with Applications, vol. 69, no. 10, pp. 1232-1241, May 2015.
%
%October 2022 David F. Crouse, Naval Research Laboratory, Washington D.C.
%(UNCLASSIFIED) DISTRIBUTION STATEMENT A. Approved for public release.

M=[-0.33333333333333333333333333333333333333,  -0.33333333333333333333333333333333333333,   0.16348665829257193285623736996835522439;
  -0.93588925356611297413803082132702052207,   0.87177850713222594827606164265404104414,  0.026705937626299132551145956798137306994;
   0.87177850713222594827606164265404104414,  -0.93588925356611297413803082132702052207,  0.026705937626299132551145956798137306994;
  -0.93588925356611297413803082132702052207,  -0.93588925356611297413803082132702052207,  0.026705937626299132551145956798137306994;
  -0.71567779788687122981567579361808335656,   0.43135559577374245963135158723616671312,    0.0919159272094894560275758192650956328;
   0.43135559577374245963135158723616671312,  -0.71567779788687122981567579361808335656,    0.0919159272094894560275758192650956328;
  -0.71567779788687122981567579361808335656,  -0.71567779788687122981567579361808335656,    0.0919159272094894560275758192650956328;
  -0.35637400942232915754980487802790257253,  0.060108237854688056554191347891388233782,   0.12780981279284809086579746752530664373;
  0.060108237854688056554191347891388233782,  -0.35637400942232915754980487802790257253,   0.12780981279284809086579746752530664373;
  -0.70373422843235889900438646986348566125,  0.060108237854688056554191347891388233782,   0.12780981279284809086579746752530664373;
  0.060108237854688056554191347891388233782,  -0.70373422843235889900438646986348566125,   0.12780981279284809086579746752530664373;
  -0.70373422843235889900438646986348566125,  -0.35637400942232915754980487802790257253,   0.12780981279284809086579746752530664373;
  -0.35637400942232915754980487802790257253,  -0.70373422843235889900438646986348566125,   0.12780981279284809086579746752530664373;
  -0.94076022102254046473232746114791439895,   0.20246665736691849090948578691737561875,  0.068369296325918857257383168082684580517;
   0.20246665736691849090948578691737561875,  -0.94076022102254046473232746114791439895,  0.068369296325918857257383168082684580517;
   -0.2617064363443780261771583257694612198,   0.20246665736691849090948578691737561875,  0.068369296325918857257383168082684580517;
   0.20246665736691849090948578691737561875,   -0.2617064363443780261771583257694612198,  0.068369296325918857257383168082684580517;
   -0.2617064363443780261771583257694612198,  -0.94076022102254046473232746114791439895,  0.068369296325918857257383168082684580517;
  -0.94076022102254046473232746114791439895,   -0.2617064363443780261771583257694612198,  0.068369296325918857257383168082684580517;
  -0.94326466932012312149912848884373958881,   0.61586120184575813015989980576348821814,  0.050595515414576768778085581365666435125;
   0.61586120184575813015989980576348821814,  -0.94326466932012312149912848884373958881,  0.050595515414576768778085581365666435125;
  -0.67259653252563500866077131691974862932,   0.61586120184575813015989980576348821814,  0.050595515414576768778085581365666435125;
   0.61586120184575813015989980576348821814,  -0.67259653252563500866077131691974862932,  0.050595515414576768778085581365666435125;
  -0.67259653252563500866077131691974862932,  -0.94326466932012312149912848884373958881,  0.050595515414576768778085581365666435125;
  -0.94326466932012312149912848884373958881,  -0.67259653252563500866077131691974862932,  0.050595515414576768778085581365666435125];
 w=M(:,3);
xi=M(:,1:2)';
%Transform the points to the standard triangle.
v1=[-1,-1, 1;
    -1, 1,-1];
v2=[1,0,0;
    0,1,0];
[A,d]=affineTransBetweenTriangles(v1,v2);
xi=bsxfun(@plus,A*xi,d);
w=w/4;
end

%LICENSE:
%
%The source code is in the public domain and not licensed or under
%copyright. The information and software may be used freely by the public.
%As required by 17 U.S.C. 403, third parties producing copyrighted works
%consisting predominantly of the material produced by U.S. government
%agencies must provide notice with such work(s) identifying the U.S.
%Government material incorporated and stating that such material is not
%subject to copyright protection.
%
%Derived works shall not identify themselves in a manner that implies an
%endorsement by or an affiliation with the Naval Research Laboratory.
%
%RECIPIENT BEARS ALL RISK RELATING TO QUALITY AND PERFORMANCE OF THE
%SOFTWARE AND ANY RELATED MATERIALS, AND AGREES TO INDEMNIFY THE NAVAL
%RESEARCH LABORATORY FOR ALL THIRD-PARTY CLAIMS RESULTING FROM THE ACTIONS
%OF RECIPIENT IN THE USE OF THE SOFTWARE.