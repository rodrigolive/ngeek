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

=head1 SYNOPSIS

  # Run app.psgi with the default settings
  > ngeek

  # run with Server::Starter
  > start_server --port 127.0.0.1:80 -- ngeek myapp.psgi

  # UNIX domain sockets
  > ngeek --listen /tmp/starman.sock

=head1 DESCRIPTION

Ngeek is a PSGI perl web server that has unique features such as:

=over 4

=item High Performance

Uses the fast XS/C HTTP header parser

=item Preforking

Spawns workers preforked like most high performance UNIX servers
do. Ngeek also reaps dead children and automatically restarts the
worker pool.

=item Signals

Supports C<HUP> for graceful restarts, and C<TTIN>/C<TTOU> to
dynamically increase or decrease the number of worker processes.

=item Superdaemon aware

Supports L<Server::Starter> for hot deploy and graceful restarts.

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

Supports chunked requests and responses, keep-alive and pipeline requests.

=item UNIX only

This server does not support Win32.

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
  -- server: HTTP::Server::PSGI (workers=10)
  Requests per second:    2792.99 [#/sec] (mean)
  -- server: HTTP::Server::Simple
  Requests per second:    1435.50 [#/sec] (mean)
  -- server: Corona
  Requests per second:    2332.00 [#/sec] (mean)
  -- server: POE
  Requests per second:    503.59 [#/sec] (mean)

This benchmark was processed with C<ab -c 10 -t 1 -k> on MacBook Pro
13" late 2009 model on Mac OS X 10.6.2 with perl 5.10.0. YMMV.

=head1 NAMING

=head1 AUTHOR

Rodrigo de Oliveira Gonzalez

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

L<Plack> L<Nginx::Engine> L<Twiggy>

=cut

