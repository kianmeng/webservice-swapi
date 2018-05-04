use strict;
use warnings;
use utf8;

use Test::More;
use Test::Pod;

if (!$ENV{AUTHOR_TESTING}) {
	my $msg = 'export AUTHOR_TESTING=1 to enable pod syntax testing.';
	plan(skip_all => $msg);
}

all_pod_files_ok();
