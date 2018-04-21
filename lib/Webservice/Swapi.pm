package Webservice::Swapi;

use 5.008001;
use strict;
use warnings;

use Moo;
with 'Role::REST::Client';

our $VERSION = "0.1.0";

has api_url => (
	is => 'ro',
	default => sub { 'https://swapi.co/api/' },
);

sub request {
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
		$url_queries = '/?' . join('?', @pairs);
	}

	my $url = $url_paths . $url_queries;
	my $response = $self->get($url);

	return $response->data if ($response->code eq '200');
}

sub schema {
	my ($self, $object) = @_;

	$self->server($self->api_url);

	return $self->request(qq|$object/schema|);
}

sub search {
	my ($self, $object, $keyword) = @_;

	my $queries = {
		search => $keyword
	};

	return $self->request($object, undef, $queries);
}


1;
__END__

=encoding utf-8

=head1 NAME

Webservice::Swapi - It's Perl module to interface with the Star Wars API (swapi.co) webservice.

=head1 SYNOPSIS

    use Webservice::Swapi;

=head1 DESCRIPTION

Webservice::Swapi is a Perl client helper library for the Star Wars API (swapi.co).

=head1 DEVELOPMENT

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

Copyright (C) Kian-Meng, Ang.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Kian-Meng, Ang E<lt>kianmeng@users.noreply.github.comE<gt>

=cut
