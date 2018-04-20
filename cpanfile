requires 'perl', '5.008001';

on 'test' => sub {
    requires 'Test::More', '0.98';
    requires 'Moo';
    requires 'REST::Client';
    requires 'Role::REST::Client';
    requires 'Data::Serializer';
};

on 'develop' => sub {
    recommends 'Devel::NYTProf';
};
