requires 'perl', '5.008001';

on 'test' => sub {
    requires 'Test::More';
    requires 'Moo';
    requires 'REST::Client';
    requires 'Role::REST::Client';
    requires 'Data::Serializer';
    requires 'Types::Standard';
};

on 'develop' => sub {
    recommends 'Devel::NYTProf';
};
