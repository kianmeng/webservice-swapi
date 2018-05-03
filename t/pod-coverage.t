use strict;
use warnings;
use utf8;

use Test::More;
use Test::Pod;

if (!$ENV{TEST_CRITIC}) {
	my $msg = 'export TEST_CRITIC=1 to enable pod syntax testing.';
	plan(skip_all => $msg);
}

all_pod_files_ok();
