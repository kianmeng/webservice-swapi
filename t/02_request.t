use strict;
use warnings;

use Test::More 0.98;

use Webservice::Swapi;

my $swapi = Webservice::Swapi->new;
my $response;

#1 request
$response = $swapi->request();
foreach my $object (keys %$response) {
	my $url = $response->{$object};
	my $expected = $swapi->api_url . qq|$object/|;

	is($url, $expected, qq|expect URL for $object root resource match|);
}

#2 schema
$response = $swapi->schema('people');
is($response->{title}, 'People', 'expect JSON scheme');

#3 search
$response = $swapi->search('people', 'solo');
is($response->{results}->[0]->{name}, 'Han Solo', 'expect people found through search');

#4 get_object
$response = $swapi->get_object('films', '1');
is($response->{title}, 'A New Hope', 'expect film found');

done_testing;
