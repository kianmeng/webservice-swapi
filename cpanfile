requires 'perl', '5.008001';

requires 'strictures', '2';
requires 'namespace::clean';
requires 'Data::Serializer';
requires 'Moo';
requires 'JSON';
requires 'REST::Client';
requires 'Role::REST::Client';
requires 'Types::Standard';

on 'test' => sub {
    requires 'Devel::Cover';
    requires 'Devel::Cover::Report::Coveralls';
    requires 'Devel::Cover::Report::Codecov';
    requires 'Dist::Zilla::App::Command::cover';
    requires 'Test::More';
    requires 'Test::Perl::Critic';
    requires 'Test::Pod';
    requires 'Test::Pod::Coverage';
    requires 'Pod::Coverage::TrustPod';
};

on 'develop' => sub {
    recommends 'Devel::NYTProf';
    requires 'App::CISetup';
    requires 'App::Software::License';
    requires 'Dist::Milla';
    requires 'Dist::Zilla::App::Command::cover';
};
