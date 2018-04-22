use strict;
use warnings;

use Test::More 0.98;

use Webservice::Swapi;

my $swapi = Webservice::Swapi->new;

my $response = $swapi->get_object('films', '1');
is($response->{title}, 'A New Hope', 'expect film found');

done_testing;
