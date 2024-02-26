function [xi,w]=eighthOrderPyramidCubPoints()
%%EIGHTHORDERPYRAMIDCUBPOINTS Generate eighth-order cubature points for
%  integration over a 3-dimensional pyramid with a square base with the
%  peak vertex at (0,0,1) and the base vertices at (1,-1,-1), (-1,-1,-1),
%  (-1,1,-1), and (1,1,-1).
% 
%INPUTS: None
%
%OUTPUTS: xi This is a 3XnumCubPoints set of points for the standard
%            square pyramid.
%          w A 1XnumCubPoints set of cubature weights. This sums to the
%            volume of the standard square pyramid (8/3).
%
%This function implements the points given in [1] (47 points).
%
%EXAMPLE:
%We compare an 8th-order moment computed using these cubature points
%to one computed using monomialIntPyramid. The results are the same within
%typical finite precision limits.
% [xi,w]=eighthOrderPyramidCubPoints();
% alpha=[4;2;2];
% theMoment=findMomentFromSamp(alpha,xi,w);
% intVal=monomialIntPyramid(alpha);
% RelErr=(theMoment-intVal)/intVal
%
%REFERENCES:
%[1] F. D. Witherden and P. E. Vincent, "On the identification of symmetric
%    quadrature rules for finite element methods," Computer and Mathematics
%    with Applications, vol. 69, no. 10, pp. 1232-1241, May 2015.
%
%October 2022 David F. Crouse, Naval Research Laboratory, Washington D.C.
%(UNCLASSIFIED) DISTRIBUTION STATEMENT A. Approved for public release.

M=[                                        0,                                             0,      0.16961086821625198841160807357430296303,      0.13184265374874503915150962831580955798;
                                           0,                                             0,     -0.45709920916162097942096244184174038575,      0.23294583850972276008807786158154187047;
                                           0,                                             0,      -0.8571191395690919692972040925801237448,       0.1025615399916185433427056721703912695;
    0.79609608877425818401350057240825839617,                                             0,     -0.99999998535272208389601372955851209324,     0.025002825067006628763387217678722243502;
                                           0,      0.79609608877425818401350057240825839617,     -0.99999998535272208389601372955851209324,     0.025002825067006628763387217678722243502;
   -0.79609608877425818401350057240825839617,                                             0,     -0.99999998535272208389601372955851209324,     0.025002825067006628763387217678722243502;
                                           0,     -0.79609608877425818401350057240825839617,     -0.99999998535272208389601372955851209324,     0.025002825067006628763387217678722243502;
    0.56488895874183987384568871426044651743,                                             0,     -0.15563259879788280847417645674822833541,     0.043496051243830853021390765401449212594;
                                           0,      0.56488895874183987384568871426044651743,     -0.15563259879788280847417645674822833541,     0.043496051243830853021390765401449212594;
   -0.56488895874183987384568871426044651743,                                             0,     -0.15563259879788280847417645674822833541,     0.043496051243830853021390765401449212594;
                                           0,     -0.56488895874183987384568871426044651743,     -0.15563259879788280847417645674822833541,     0.043496051243830853021390765401449212594;
    0.75302269354894756094500969219941272468,                                             0,     -0.70447200540690062790548707515722730722,     0.085972592189522311083702670388617702554;
                                           0,      0.75302269354894756094500969219941272468,     -0.70447200540690062790548707515722730722,     0.085972592189522311083702670388617702554;
   -0.75302269354894756094500969219941272468,                                             0,     -0.70447200540690062790548707515722730722,     0.085972592189522311083702670388617702554;
                                           0,     -0.75302269354894756094500969219941272468,     -0.70447200540690062790548707515722730722,     0.085972592189522311083702670388617702554;
    0.24657794246228701631399967234303066604,      0.24657794246228701631399967234303066604,      0.34690569585096941192869185686421558358,     0.033693598991694192959947383133729992714;
    0.24657794246228701631399967234303066604,     -0.24657794246228701631399967234303066604,      0.34690569585096941192869185686421558358,     0.033693598991694192959947383133729992714;
   -0.24657794246228701631399967234303066604,      0.24657794246228701631399967234303066604,      0.34690569585096941192869185686421558358,     0.033693598991694192959947383133729992714;
   -0.24657794246228701631399967234303066604,     -0.24657794246228701631399967234303066604,      0.34690569585096941192869185686421558358,     0.033693598991694192959947383133729992714;
      0.733889532546736034455005667208354524,        0.733889532546736034455005667208354524,     -0.50885838992749887300910718599394991577,     0.016574786736306812829168423699380538904;
      0.733889532546736034455005667208354524,       -0.733889532546736034455005667208354524,     -0.50885838992749887300910718599394991577,     0.016574786736306812829168423699380538904;
     -0.733889532546736034455005667208354524,        0.733889532546736034455005667208354524,     -0.50885838992749887300910718599394991577,     0.016574786736306812829168423699380538904;
     -0.733889532546736034455005667208354524,       -0.733889532546736034455005667208354524,     -0.50885838992749887300910718599394991577,     0.016574786736306812829168423699380538904;
 8.2682671512759671070733214668120998744e-05,   8.2682671512759671070733214668120998744e-05,      0.71650072530116328406253461877461140784,    0.0069686742230647669915684670235521865055;
 8.2682671512759671070733214668120998744e-05,  -8.2682671512759671070733214668120998744e-05,      0.71650072530116328406253461877461140784,    0.0069686742230647669915684670235521865055;
-8.2682671512759671070733214668120998744e-05,   8.2682671512759671070733214668120998744e-05,      0.71650072530116328406253461877461140784,    0.0069686742230647669915684670235521865055;
-8.2682671512759671070733214668120998744e-05,  -8.2682671512759671070733214668120998744e-05,      0.71650072530116328406253461877461140784,    0.0069686742230647669915684670235521865055;
    0.39899655709522770213204971246835352882,      0.39899655709522770213204971246835352882,       -0.905193536761024932000392660301831356,     0.078199915186776001276629590295086773482;
    0.39899655709522770213204971246835352882,     -0.39899655709522770213204971246835352882,       -0.905193536761024932000392660301831356,     0.078199915186776001276629590295086773482;
   -0.39899655709522770213204971246835352882,      0.39899655709522770213204971246835352882,       -0.905193536761024932000392660301831356,     0.078199915186776001276629590295086773482;
   -0.39899655709522770213204971246835352882,     -0.39899655709522770213204971246835352882,       -0.905193536761024932000392660301831356,     0.078199915186776001276629590295086773482;
    0.36531241447958999003326854299025213837,      0.36531241447958999003326854299025213837,     -0.19562858755898781208157405487726925012,      0.09695835803779916324529325757517456104;
    0.36531241447958999003326854299025213837,     -0.36531241447958999003326854299025213837,     -0.19562858755898781208157405487726925012,      0.09695835803779916324529325757517456104;
   -0.36531241447958999003326854299025213837,      0.36531241447958999003326854299025213837,     -0.19562858755898781208157405487726925012,      0.09695835803779916324529325757517456104;
   -0.36531241447958999003326854299025213837,     -0.36531241447958999003326854299025213837,     -0.19562858755898781208157405487726925012,      0.09695835803779916324529325757517456104;
    0.48342524404083818448316048507452071227,      0.48342524404083818448316048507452071227,      -0.6193703578271817921429725882760024584,      0.10928549585578987401418986532517092138;
    0.48342524404083818448316048507452071227,     -0.48342524404083818448316048507452071227,      -0.6193703578271817921429725882760024584,      0.10928549585578987401418986532517092138;
   -0.48342524404083818448316048507452071227,      0.48342524404083818448316048507452071227,      -0.6193703578271817921429725882760024584,      0.10928549585578987401418986532517092138;
   -0.48342524404083818448316048507452071227,     -0.48342524404083818448316048507452071227,      -0.6193703578271817921429725882760024584,      0.10928549585578987401418986532517092138;
    0.63140479760056088062582891340019355538,      0.89485619649153056248689063682197549292,     -0.90904839155249779567018573275816306293,     0.026838430536177238417907867814423429749;
    0.89485619649153056248689063682197549292,      0.63140479760056088062582891340019355538,     -0.90904839155249779567018573275816306293,     0.026838430536177238417907867814423429749;
    0.63140479760056088062582891340019355538,     -0.89485619649153056248689063682197549292,     -0.90904839155249779567018573275816306293,     0.026838430536177238417907867814423429749;
   -0.89485619649153056248689063682197549292,      0.63140479760056088062582891340019355538,     -0.90904839155249779567018573275816306293,     0.026838430536177238417907867814423429749;
   -0.63140479760056088062582891340019355538,      0.89485619649153056248689063682197549292,     -0.90904839155249779567018573275816306293,     0.026838430536177238417907867814423429749;
    0.89485619649153056248689063682197549292,     -0.63140479760056088062582891340019355538,     -0.90904839155249779567018573275816306293,     0.026838430536177238417907867814423429749;
   -0.63140479760056088062582891340019355538,     -0.89485619649153056248689063682197549292,     -0.90904839155249779567018573275816306293,     0.026838430536177238417907867814423429749;
   -0.89485619649153056248689063682197549292,     -0.63140479760056088062582891340019355538,     -0.90904839155249779567018573275816306293,     0.026838430536177238417907867814423429749];
w=M(:,4);
xi=M(:,1:3)';

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