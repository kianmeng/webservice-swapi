use strict;
use warnings;

use Test::More 0.98;

use Webservice::Swapi;

my $swapi = Webservice::Swapi->new;

my $response = $swapi->schema('people');
is($response->{title}, 'People', 'expect JSON scheme');

done_testing;
