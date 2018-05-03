use strict;
use warnings;
use utf8;

use Test::More;
use Test::Perl::Critic;

if (!$ENV{AUTHOR_TESTING}) {
	my $msg = 'export AUTHOR_TESTING=1 to enable code critic testing.';
	plan(skip_all => $msg);
}

Test::Perl::Critic->import(-profile => "t/perlcritic.rc");
all_critic_ok();
