requires 'perl', '5.008001';

on 'test' => sub {
    requires 'Test::More';
    requires 'Minilla';
    requires 'Moo';
    requires 'REST::Client';
    requires 'Role::REST::Client';
    requires 'Data::Serializer';
    requires 'Data::Serializer::JSON';
    requires 'Types::Standard';
};

on 'develop' => sub {
    recommends 'Devel::NYTProf';
};
