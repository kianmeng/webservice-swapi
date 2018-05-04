use strict;
use warnings;
use utf8;

use Test::More;
use Test::Pod::Coverage;
use Pod::Coverage::TrustPod;

if (!$ENV{AUTHOR_TESTING}) {
	my $msg = 'export AUTHOR_TESTING=1 to enable pod coverage testing.';
	plan(skip_all => $msg);
}

all_pod_coverage_ok({
    coverage_class => 'Pod::Coverage::TrustPod',
    trustme => ['BUILD']
});
