package BSD::devstat;
use strict;
use warnings;
our $VERSION = '0.01';
our @ISA;

eval {
    require XSLoader;
    XSLoader::load(__PACKAGE__, $VERSION);
    1;
} or do {
    require DynaLoader;
    push @ISA, 'DynaLoader';
    __PACKAGE__->bootstrap($VERSION);
};

1;
__END__

=head1 NAME

BSD::devstat -

=head1 SYNOPSIS

  use BSD::devstat;

=head1 DESCRIPTION

BSD::devstat is

=head1 AUTHOR

Jun Kuriyama E<lt>kuriyama@s2factory.co.jpE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
