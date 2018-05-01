use strict;
use warnings;

use Test::More 0.98;

use Webservice::Swapi;

my $swapi = Webservice::Swapi->new;
my $response;

$response = $swapi->ping();
is($response, 1, 'expect server is up');

done_testing;
