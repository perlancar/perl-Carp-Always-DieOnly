package Carp::Always::DieOnly;

# DATE
# VERSION

use 5.006;

use Carp ();

sub _die {
    die @_ if ref($_[0]);
    if ($_[-1] =~ /\n$/s) {
        my $arg = pop @_;
        $arg =~ s/(.*)( at .*? line .*?\n$)/$1/s;
        push @_, $arg;
    }
    die &Carp::longmess;
}

my %OLD_SIG;

BEGIN {
  @OLD_SIG{qw(__DIE__)} = @SIG{qw(__DIE__)};
  $SIG{__DIE__} = \&_die;
}

END {
  @SIG{qw(__DIE__)} = @OLD_SIG{qw(__DIE__)};
}

1;
# ABSTRACT: Like Carp::Always, but only print stacktrace on die()

=head1 SYNOPSIS

 % perl -MCarp::Always::DieOnly script.pl


=head1 SEE ALSO

L<Carp::Always>

=cut
