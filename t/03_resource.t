use strict;
use warnings;

use Test::More 0.98;

use Webservice::Swapi;

my $swapi = Webservice::Swapi->new;

my $response = $swapi->resources();
foreach my $object (keys %$response) {
	my $url = $response->{$object};
	my $expected = $swapi->api_url . qq|$object/|;

	is($url, $expected, qq|expect URL for $object root resource match|);
}

done_testing;
