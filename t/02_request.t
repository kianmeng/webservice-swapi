use strict;
use warnings;

use Test::More 0.98;

use Webservice::Swapi;

my $swapi = Webservice::Swapi->new;
my $response;

$response = $swapi->_request();
is(ref $response, 'HASH', 'expect hash found');

done_testing;
