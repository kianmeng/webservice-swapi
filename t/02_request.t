use strict;
use warnings;

use Test::More 0.98;

use Webservice::Swapi;

my $swapi = Webservice::Swapi->new;
my $response = $swapi->request('planets', 1);

is($response->{name}, 'Tatooine', 'http get successfull');

done_testing;
