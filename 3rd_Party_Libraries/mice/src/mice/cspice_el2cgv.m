%-Abstract
%
%   CSPICE_EL2CGV converts a SPICE ellipse to a center vector and two
%   generating vectors. The selected generating vectors are semi-axes of
%   the ellipse.
%
%-Disclaimer
%
%   THIS SOFTWARE AND ANY RELATED MATERIALS WERE CREATED BY THE
%   CALIFORNIA  INSTITUTE OF TECHNOLOGY (CALTECH) UNDER A U.S.
%   GOVERNMENT CONTRACT WITH THE NATIONAL AERONAUTICS AND SPACE
%   ADMINISTRATION (NASA). THE SOFTWARE IS TECHNOLOGY AND SOFTWARE
%   PUBLICLY AVAILABLE UNDER U.S. EXPORT LAWS AND IS PROVIDED
%   "AS-IS" TO THE RECIPIENT WITHOUT WARRANTY OF ANY KIND, INCLUDING
%   ANY WARRANTIES OF PERFORMANCE OR MERCHANTABILITY OR FITNESS FOR
%   A PARTICULAR USE OR PURPOSE (AS SET FORTH IN UNITED STATES UCC
%   SECTIONS 2312-2313) OR FOR ANY PURPOSE WHATSOEVER, FOR THE
%   SOFTWARE AND RELATED MATERIALS, HOWEVER USED.
%
%   IN NO EVENT SHALL CALTECH, ITS JET PROPULSION LABORATORY,
%   OR NASA BE LIABLE FOR ANY DAMAGES AND/OR COSTS, INCLUDING,
%   BUT NOT LIMITED TO, INCIDENTAL OR CONSEQUENTIAL DAMAGES OF
%   ANY KIND, INCLUDING ECONOMIC DAMAGE OR INJURY TO PROPERTY
%   AND LOST PROFITS, REGARDLESS OF WHETHER CALTECH, JPL, OR
%   NASA BE ADVISED, HAVE REASON TO KNOW, OR, IN FACT, SHALL
%   KNOW OF THE POSSIBILITY.
%
%   RECIPIENT BEARS ALL RISK RELATING TO QUALITY AND PERFORMANCE
%   OF THE SOFTWARE AND ANY RELATED MATERIALS, AND AGREES TO
%   INDEMNIFY CALTECH AND NASA FOR ALL THIRD-PARTY CLAIMS RESULTING
%   FROM THE ACTIONS OF RECIPIENT IN THE USE OF THE SOFTWARE.
%
%-I/O
%
%   Given:
%
%      ellipse   a structure describing a SPICE ellipse. The structure has
%                the fields:
%
%                [1,1] = size(ellipse); struct = class(ellipse)
%
%                The structure has the fields:
%
%                center:    [3,1] = size(center); double = class(center)
%                semiMinor: [3,1] = size(semiMinor); double = class(semiMinor)
%                semiMajor: [3,1] = size(semiMajor); double = class(semiMajor)
%
%   the call:
%
%      [center, semiMajor, semiMinor] = cspice_el2cgv( ellipse )
%
%   returns:
%
%      center   the location of the center of 'ellipse'.
%
%               [3,1] = size(center); double = class(center)
%
%      smajor   the semi-major axis of 'ellipse'.
%
%               [3,1] = size(smajor); double = class(smajor)
%
%      sminor   double precision 3x1 array defining the semi-minor
%               axis of 'ellipse'
%
%               [3,1] = size(sminor); double = class(sminor)
%
%               This ellipse is the set of points
%
%                  center + cos(theta) smajor + sin(theta) sminor
%
%                where theta ranges over the interval (-pi, pi].
%
%-Examples
%
%   Any numerical results shown for this example may differ between
%   platforms as the results depend on the SPICE kernels used as input
%   and the machine specific arithmetic implementation.
%
%      %
%      % Define two arbitrary, linearly independent vectors
%      % and a center vector.
%      %
%      vec1    = [ 1;  1; 1 ];
%      vec2    = [ 1; -1; 1 ];
%      center  = [ 1;  1; 1 ];
%
%      %
%      % Calculate the semi-major and semi-minor axes of
%      % the ellipse as generated by 'vec1' and 'vec2'.
%      % [The cspice_saelgv call determines the orthogonal axes
%      % of an ellipse from two generating vectors.]
%      %
%      [smajor, sminor ] = cspice_saelgv( vec1, vec2 );
%
%      %
%      % Load the generating vectors into an ellipse structure.
%      %
%      [ ellipse ] = cspice_cgv2el( center, smajor, sminor );
%
%      %
%      % Extract the CSPICE_ELLIPSE structure components into
%      % variable.
%      %
%      [ cent, smaj, smin ] = cspice_el2cgv( ellipse )
%
%   MATLAB outputs:
%
%      cent =
%
%           1
%           1
%           1
%
%      smaj =
%
%          1.4142
%         -0.0000
%          1.4142
%
%      smin =
%
%          0.0000
%          1.4142
%          0.0000
%
%-Particulars
%
%   SPICE ellipses serve to simplify calling sequences and reduce
%   the chance for error in declaring and describing argument lists
%   involving ellipses.
%
%   The set of ellipse conversion routines is
%
%      cspice_cgv2el( Center and generating vectors to ellipse )
%      cspice_el2cgv( Ellipse to center and generating vectors )
%
%   A word about the output of this routine:   the semi-major axis of
%   an ellipse is a vector of largest possible magnitude in the set
%
%      cos(theta) vec1  +  sin(theta) vec2,
%
%   where theta is in the interval (-pi, pi].  There are two such
%   vectors; they are additive inverses of each other. The semi-minor
%   axis is an analogous vector of smallest possible magnitude.  The
%   semi-major and semi-minor axes are orthogonal to each other.  If
%   smajor and sminor are choices of semi-major and semi-minor axes,
%   then the input ellipse can also be represented as the set of
%   points
%
%      center + cos(theta) smajor + sin(theta) sminor
%
%   where theta ranges over the interval (-pi, pi].
%
%-Required Reading
%
%   For important details concerning this module's function, please refer to
%   the CSPICE routine el2cgv_c.
%
%   MICE.REQ
%   ELLIPSES.REQ
%
%-Version
%
%   -Mice Version 1.0.1, 09-NOV-2012, EDW (JPL)
%
%      Edited I/O section to conform to NAIF standard for Mice documentation.
%
%   -Mice Version 1.0.0, 30-DEC-2008, EDW (JPL)
%
%-Index_Entries
%
%   ellipse to center and generating vectors
%
%-&

function [center, smajor, sminor] = cspice_el2cgv( ellipse )

   switch nargin

      case 1

         ellipse = zzmice_ell(ellipse);

      otherwise

         error ( ['Usage: [center(3), smajor(3), sminor(3)] = ' ...
                  'cspice_el2cgv( ellipse )'] )

   end

   %
   % Call the MEX library.
   %
   try
      [center, smajor, sminor] = mice('el2cgv_c', ellipse );
   catch
      rethrow(lasterror)
   end

