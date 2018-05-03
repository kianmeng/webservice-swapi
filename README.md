[![Build Status](https://travis-ci.org/kianmeng/webservice-swapi.svg?branch=master)](https://travis-ci.org/kianmeng/webservice-swapi) [![Coverage Status](https://img.shields.io/coveralls/kianmeng/webservice-swapi/master.svg?style=flat)](https://coveralls.io/r/kianmeng/webservice-swapi?branch=master) [![Coverage Status](http://codecov.io/github/kianmeng/webservice-swapi/coverage.svg?branch=master)](https://codecov.io/github/kianmeng/webservice-swapi?branch=master) [![MetaCPAN Release](https://badge.fury.io/pl/Webservice-Swapi.svg)](https://metacpan.org/release/Webservice-Swapi)
# NAME

Webservice::Swapi - A Perl module to interface with the Star Wars API
(swapi.co) webservice.

# SYNOPSIS

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

# DESCRIPTION

Webservice::Swapi is a Perl client helper library for the Star Wars API (swapi.co).

# DEVELOPMENT

Source repo at [https://github.com/kianmeng/webservice-swapi](https://github.com/kianmeng/webservice-swapi).

## Docker

If you have Docker installed, you can build your Docker container for this
project.

    $ docker build -t webservice-swapi .
    $ docker run -it -v $(pwd):/root webservice-swapi bash

## Carton

To setup the development environment and run the test using Carton.

    $ carton install
    $ export PERL5LIB=$(pwd)/local/lib/perl5/
    $ export PATH=$HOME/perl5/bin:$(pwd)/local/bin:$PATH

To enable Perl::Critic test cases, enable the flag.

    $ AUTHOR_TESTING=1 carton exec -- prove -Ilib -lv t

## Minilla

To use Minilla instead. This will update the README.md file from the source.

    $ cpanm Minilla
    $ minil build
    $ minil test
    $ FAKE_RELEASE=1 minil release # testing
    $ minil release # actual

# METHODS

## BUILD

Constructor of the object.

    # Instantiate the class.
    my $swapi = Webservice::Swapi->new;

    # Set the API URL.
    my $swapi = Webservice::Swapi->new(api_url => 'http://example.com/api/');

## get\_object

Get full details of a object or resource.

    # Get the details of different available object using id.
    my $object = $swapi->get_object('films', '1');

    # Get the result in different format.
    my $object_json = $swapi->get_object('films', '1', 'json');
    my $object_wookie = $swapi->get_object('films', '1', 'wookiee');

## ping

Check if the API service is responding to request.

    my $server_status = $swapi->ping();

## resources

List down all the available objects.

    # Get all available resources (objects).
    my $resources = $swapi->resources();

    # Similarly but in different format.
    my $resources_json = $swapi->resources('json');
    my $resources_wookie = $swapi->resources('wookie');

## schema

Show the data structure.

    # Get the schema / structure of a resource or object.
    my $schema = $swapi->schema('people');

## search

Searching by keywords.

    # Search a resource or object by keywords.
    my $results = $swapi->search('people', 'solo');

    # Or in different format.
    my $results = $swapi->search('people', 'solo', 'json');
    my $results = $swapi->search('people', 'solo', 'wookiee');

# COPYRIGHT AND LICENSE

This software is Copyright (c) 2017 by Kian Meng, Ang.

This is free software, licensed under:

    The Artistic License 2.0 (GPL Compatible)

# AUTHOR

Kian-Meng, Ang <kianmeng@users.noreply.github.com>
