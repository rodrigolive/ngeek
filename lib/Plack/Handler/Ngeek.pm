package Plack::Handler::Ngeek;
use strict;
use Ngeek::Server;

sub new {
    my $class = shift;
    bless { @_ }, $class;
}

sub run {
    my($self, $app) = @_;

    if ($ENV{SERVER_STARTER_PORT}) {
        require Net::Server::SS::PreFork;
        @Ngeek::Server::ISA = qw(Net::Server::SS::PreFork); # Yikes.
    }

    Ngeek::Server->new->run($app, {%$self});
}

1;

__END__

=head1 NAME

Plack::Handler::Ngeek - Plack adapter for Ngeek

=head1 SYNOPSIS

  plackup -s Ngeek

=head1 AUTHOR

Rodrigo de Oliveira

=head1 SEE ALSO

L<Ngeek>

=cut


