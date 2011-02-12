use strict;
use warnings;
use Test::More;
use Plack::Test::Suite;

Plack::Test::Suite->run_server_tests('Ngeek');
done_testing();

