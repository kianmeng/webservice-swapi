package Webservice::Swapi;

use 5.008001;
use strict;
use warnings;
use utf8;

use Moo;
use Types::Standard qw(Str);

with 'Role::REST::Client';

our $VERSION = '0.1.2';

has api_url => (
    isa     => Str,
    is      => 'rw',
    default => sub { 'https://swapi.co/api/' },
);

sub BUILD {
    my ($self) = @_;

    $self->set_persistent_header('User-Agent' => __PACKAGE__ . q| |
          . ($Webservice::Swapi::VERSION || q||));
    $self->server($self->api_url);

    return $self;
}

sub ping {
    my ($self) = @_;

    my $response = $self->resources();

    return (!exists $response->{films}) ? 0 : 1;
}

sub resources {
    my ($self, $format) = @_;

    my $queries;
    $queries->{format} = $format if (defined $format);

    return $self->_request(undef, undef, $queries);
}

sub schema {
    my ($self, $object) = @_;

    return $self->_request(qq|$object/schema|);
}

sub search {
    my ($self, $object, $keyword, $format) = @_;

    my $queries;
    $queries->{search} = $keyword;
    $queries->{format} = $format if (defined $format);

    return $self->_request($object, undef, $queries);
}

sub get_object {
    my ($self, $object, $id, $format) = @_;

    my $queries;
    $queries->{format} = $format if (defined $format);

    return $self->_request($object, $id, $queries);
}

sub _request {
    my ($self, $object, $id, $queries) = @_;

    # In case the api_url was updated.
    $self->server($self->api_url);

    my @paths;
    push @paths, $object if (defined $object);
    push @paths, $id     if (defined $id);

    my ($url_paths, $url_queries) = (q||, q||);

    $url_paths = join q|/|, @paths;

    if (defined $queries) {
        my @pairs;
        foreach my $k (keys %{$queries}) {
            push @pairs, $k . q|=| . $queries->{$k};
        }

        $url_queries .= ($url_paths eq q||) ? q|?| : q|/?|;
        $url_queries .= join q|&|, @pairs;
    }

    my $url = $url_paths . $url_queries;

    my $response = $self->get($url);

    return $response->data if ($response->code eq '200');

    return;
}

1;
__END__

=encoding utf-8

=head1 NAME

Webservice::Swapi - A Perl module to interface with the Star Wars API
(swapi.co) webservice.

=head1 SYNOPSIS

    use Webservice::Swapi;

    $swapi = Webservice::Swapi->new;

    # Check if API server is up
    my $resources = $swapi->ping();

    # Get information of all available resources
    my $resources = $swapi->resources();

    # View the JSON schema for people resource
    my $schema = $swapi->schema('people');

    # Searching
    my $results = $swapi->search('people', 'solo');

    # Get resource item
    my $item = $swapi->get_object('films', '1');

=head1 DESCRIPTION

Webservice::Swapi is a Perl client helper library for the Star Wars API (swapi.co).

=head1 DEVELOPMENT

Source repo at L<https://github.com/kianmeng/webservice-swapi|https://github.com/kianmeng/webservice-swapi>.

=head2 Docker

If you have Docker installed, you can build your Docker container for this
project.

    $ docker build -t webservice-swapi .
    $ docker run -it -v $(pwd):/root webservice-swapi bash

=head2 Carton

To setup the development environment and run the test using Carton.

    $ carton install
    $ export PERL5LIB=$(pwd)/local/lib/perl5/
    $ export PATH=$HOME/perl5/bin:$(pwd)/local/bin:$PATH

To enable Perl::Critic test cases, enable the flag.

    $ TEST_CRITIC=1 carton exec -- prove -Ilib -lv t

=head2 Minlla

To use Minilla instead. This will update the README.md file from the source.

    $ cpanm Minilla
    $ minil build
    $ minil test
    $ FAKE_RELEASE=1 minil release # testing
    $ minil release # actual

=head1 LICENSE

This software is Copyright (c) 2017 by Kian Meng, Ang.

This is free software, licensed under:

  The Artistic License 2.0 (GPL Compatible)

=head1 AUTHOR

Kian-Meng, Ang E<lt>kianmeng@users.noreply.github.comE<gt>

=cut
