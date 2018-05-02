requires 'perl', '5.008001';

requires 'Moo';
requires 'JSON';
requires 'REST::Client';
requires 'Role::REST::Client';
requires 'Data::Serializer';
requires 'Types::Standard';

on 'test' => sub {
    requires 'Devel::Cover';
    requires 'Devel::Cover::Report::Codealls';
    requires 'Devel::Cover::Report::Codecov';
    requires 'Test::More';
    requires 'Test::Perl::Critic';
    requires 'Minilla';
};

on 'develop' => sub {
    requires 'Minilla';
    recommends 'Devel::NYTProf';
};
