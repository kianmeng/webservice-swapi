use strict;
use warnings;
use utf8;

use Test::More;
use Test::Pod::Coverage;
use Pod::Coverage::TrustPod;

if (!$ENV{TEST_CRITIC}) {
	my $msg = 'export TEST_CRITIC=1 to enable pod coverage.';
	plan(skip_all => $msg);
}

all_pod_coverage_ok({coverage_class => 'Pod::Coverage::TrustPod'});
