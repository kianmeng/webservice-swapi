use strict;
use warnings;

use Test::More 0.98;

use Webservice::Swapi;

my $swapi = Webservice::Swapi->new;

my $response = $swapi->search('people', 'solo');
is($response->{results}->[0]->{name}, 'Han Solo', 'expect people found through search');

done_testing;
