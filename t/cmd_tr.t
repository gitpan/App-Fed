#!/usr/bin/perl
################################################################################
# 
# fed - File editor.
#
# Copyright (C) 2011 Bartłomiej /Natanael/ Syguła
#
# This is free software.
# It is licensed, and can be distributed under the same terms as Perl itself.
#
################################################################################
use strict; use warnings; # {{{

use FindBin qw( $Bin );

use English qw( -no_match_vars );
use File::Slurp qw( read_file );
use Test::More;
# }}}

# Debug:
use lib $Bin . q{/../lib};

plan tests => 2;

use App::Fed;

mkdir $Bin .q{/_tmp_}. $PID;
END {
    system q{rm}, q{-Rf}, $Bin .q{/_tmp_}. $PID;
}



system q{cp}, $Bin . q{/../t_data/text_B.txt}, $Bin . q{/_tmp_} . $PID . q{/test.txt};
is(
    App::Fed::main("tr/fbao/FBec/", $Bin . q{/_tmp_} . $PID . q{/test.txt}),
    0,
    'Simple translate'
);
is(
    read_file($Bin . q{/_tmp_} . $PID . q{/test.txt}),
    q{Fcc Ber Bez
Bez Fcc Ber
Ber Bez Fcc

Fcc Ber Bez Fcc Ber Bez
Bez Fcc Ber Bez Fcc Ber
Ber Bez Fcc Ber Bez Fcc

Fcc Ber Bez Ber Fcc
Bez Fcc Ber Fcc Bez
Ber Bez Fcc Bez Ber
},
    q{Simple translate - check},
);
system q{rm}, q{-f}, $Bin . q{/_tmp_} . $PID . q{/test.txt};



# vim: fdm=marker
