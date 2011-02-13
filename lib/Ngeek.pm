package Ngeek;

use strict;
use 5.008_001;
our $VERSION = '0.01';

1;
__END__

=encoding utf-8

=for stopwords

=head1 NAME

Ngeek - Nginx::Engine based PSGI/Plack web server

WIP: half of the chunked tests and HTTP 1.1 are still failing. 

=head1 SYNOPSIS

  # Run app.psgi with the default settings
  > ngeek
  
  # Or with plackup 
  > plackup -s Ngeek app.psgi

=head1 DESCRIPTION

Ngeek is a PSGI perl web server that has unique features such as:

=over 4

=item High Performance

Uses the fast XS/C HTTP header parser

=item AnyEvent-style speed

AnyEvent style connection handling, but done by the same Nginx
engine we've grow to love.

=item Multiple interfaces and UNIX Domain Socket support

Able to listen on multiple intefaces including UNIX sockets.

=item Small memory footprint

Preloading the applications with C<--preload-app> command line option
enables copy-on-write friendly memory management. Also, the minimum
memory usage Ngeek requires for the master process is 7MB and
children (workers) is less than 3.0MB.

=item PSGI compatible

Can run any PSGI applications and frameworks

=item HTTP/1.1 support

WIP: Support chunked requests and responses, keep-alive and pipeline requests.

=item UNIX only

This server does not support Win32, but it all depends on Nginx::Engine.

=back

=head1 PERFORMANCE

Here's a simple benchmark using C<Hello.psgi>.

  -- server: Ngeek (workers=10)
  Requests per second:    6849.16 [#/sec] (mean)
  -- server: Twiggy
  Requests per second:    3911.78 [#/sec] (mean)
  -- server: AnyEvent::HTTPD
  Requests per second:    2738.49 [#/sec] (mean)
  -- server: HTTP::Server::PSGI
  Requests per second:    2218.16 [#/sec] (mean)

This benchmark was processed with C<ab -c 10 -t 1 -k> on MacBook Air
13" late 2010 model on Mac OS X 10.6.2 with perl 5.10.1. YMMV.

=head1 AUTHOR

Rodrigo de Oliveira Gonzalez

Heavly copied from Starman. 

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

L<Plack> L<Nginx::Engine> L<Twiggy>

=cut

