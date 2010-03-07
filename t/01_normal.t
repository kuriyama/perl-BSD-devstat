use strict;
use warnings;
use Test::More tests => 2;

BEGIN { use_ok 'BSD::devstat' }

my $o = BSD::devstat->new();
ok $o, 'new';

