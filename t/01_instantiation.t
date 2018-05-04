use strict;
use warnings;
use utf8;

use Test::More;

use Webservice::Swapi;

my $swapi;

$swapi = Webservice::Swapi->new;
is(ref $swapi, 'Webservice::Swapi', 'expect object instantiate through new');
is($swapi->api_url, 'https://swapi.co/api/', 'expect api url match');

$swapi = Webservice::Swapi->new({api_url => 'https://foobar/api/'});
is($swapi->api_url, 'https://foobar/api/', 'expect api url match');

done_testing;
