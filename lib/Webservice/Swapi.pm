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
	my ($self, $object, $id, $schema_only) = @_;

	$self->server($self->api_url);

	my @params;
	push @params, $object if (defined $object);
	push @params, $id if (defined $id && !defined $schema_only);
	push @params, 'schema' if (defined $schema_only);

	my $response = $self->get(join('/', @params));

	return $response->data if ($response->code eq '200');
}

sub schema {
	my ($self, $object) = @_;

	$self->server($self->api_url);

	return $self->request($object, undef, 1);
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

=head1 LICENSE

Copyright (C) Kian-Meng, Ang.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Kian-Meng, Ang E<lt>kianmeng@users.noreply.github.comE<gt>

=cut
