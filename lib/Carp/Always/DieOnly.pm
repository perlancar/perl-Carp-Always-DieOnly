package Carp::Always::DieOnly;

# DATE
# VERSION

use 5.006;

use Carp::Always 0.15 ();
BEGIN { our @ISA = qw(Carp::Always) }

sub _warn { warn @_ }

1;
# ABSTRACT: Like Carp::Always, but only print stacktrace on die()

=head1 SYNOPSIS

 % perl -MCarp::Always::DieOnly script.pl


=head1 SEE ALSO

L<Carp::Always>

=cut
