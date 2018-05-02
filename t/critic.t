use strict;
use warnings;
use utf8;

use Test::More;
use Test::Perl::Critic;

if (!$ENV{TEST_CRITIC}) {
	my $msg = 'export TEST_CRITIC=1 to enable code critic.';
	plan(skip_all => $msg);
}

Test::Perl::Critic->import(-profile => "t/perlcritic.rc");
all_critic_ok();
