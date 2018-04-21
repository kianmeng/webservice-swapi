use strict;
use warnings;

use Test::More 0.98;

use Webservice::Swapi;

my $swapi = Webservice::Swapi->new;
my $response;

$response = $swapi->request();
foreach my $object (keys %$response) {
	my $url = $response->{$object};
	my $expected = $swapi->api_url . qq|$object/|;

	is($url, $expected, qq|expect URL for $object root resource match|);
}

$response = $swapi->schema('people');
is($response->{title}, 'People', 'expect JSON scheme');

done_testing;
