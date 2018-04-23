package Webservice::Swapi;

use 5.008001;
use strict;
use warnings;

use Moo;
use Types::Standard qw(Str);

with 'Role::REST::Client';

our $VERSION = "0.1.0";

has api_url => (
	isa => Str,
	is => 'ro',
	default => sub { 'https://swapi.co/api/' },
);

sub resources {
	my ($self, $format) = @_;

	my $queries;
	$queries->{format} = $format if (defined $format);

	return $self->_request(undef, undef, $queries);
}

sub schema {
	my ($self, $object, $format) = @_;

	my $queries;
	$queries->{format} = $format if (defined $format);

	return $self->_request(qq|$object/schema|, undef, $queries);
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

	$self->server($self->api_url);

	my @paths;
	push @paths, $object if (defined $object);
	push @paths, $id if (defined $id);

	my ($url_paths, $url_queries) = ('', '');

	$url_paths = join('/', @paths);

	if (defined $queries) {
		my @pairs;
		foreach my $k (keys %$queries) {
			push @pairs, $k . "=" . $queries->{$k};
		}

		$url_queries .= ($url_paths eq '') ? '?' : '/?';
		$url_queries .= join('?', @pairs);
	}

	my $url = $url_paths . $url_queries;

	my $response = $self->get($url);

	return $response->data if ($response->code eq '200');
}


1;
__END__

=encoding utf-8

=head1 NAME

Webservice::Swapi - A Perl module to interface with the L<Star Wars API|http://swapi.co> webservice.

=head1 SYNOPSIS

    use Webservice::Swapi;

    $swapi = Webservice::Swapi->new;

    # Get information of all available resources
    my $resources = $swapi->resources();

    # View the JSON schema for people resource
    my $schema = $swapi->schema('people');

    # Searching
    my $results = $swapi->search('people', 'solo');

    # Get resource item
    my $item = $swapi->get_object('films', '1');

=head1 DESCRIPTION

Webservice::Swapi is a Perl client helper library for the L<Star Wars API|http://swapi.co>.

=head1 DEVELOPMENT

Source repo at L<https://github.com/kianmeng/webservice-swapi|https://github.com/kianmeng/webservice-swapi>.

To setup the development environment.

    $ cpanm -nq --installdeps --with-develop --with-recommends .

Or using Carton.

    $ carton install

Run these commands to developer, test, and release.

    $ minil test
    $ FAKE_RELEASE=1 minil release

Or using Cargon (faster).

    $ carton exec -- prove -Ilib -r t

=head1 LICENSE

Copyright 2017 (C) Kian-Meng, Ang.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Kian-Meng, Ang E<lt>kianmeng@users.noreply.github.comE<gt>

=cut
