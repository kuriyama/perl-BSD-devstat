use strict;
use warnings;
use Test::More tests => 9;

BEGIN { use_ok 'BSD::devstat' }

my $o = BSD::devstat->new();
ok $o, 'new';

$_ = $o->numdevs;
ok $_ > 0, 'num()=' . ($_||0);

$_ = $o->devices(0);
is ref $_, 'HASH', 'devices() returns HASH';

is join(',', sort keys %$_), 'block_size,busy_time_frac,busy_time_sec,bytes_free,bytes_read,bytes_write,creation_time_frac,creation_time_sec,device_name,device_type,duration_free_frac,duration_free_sec,duration_read_frac,duration_read_sec,duration_write_frac,duration_write_sec,flags,operations_free,operations_other,operations_read,operations_write,priority,tag_head,tag_ordered,tag_simple,unit_number', 'keys';

ok exists $_->{device_name}, 'exists {device_name}';
ok length($_->{device_name}) > 0, '  has len: ' . ($_->{device_name}||'');
ok exists $_->{unit_number}, 'exists {unit_number}';
like $_->{unit_number}, qr/^\d+$/, '  like number';
