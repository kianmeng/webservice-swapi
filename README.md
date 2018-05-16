[![Build Status](https://travis-ci.org/kianmeng/webservice-swapi.svg?branch=master)](https://travis-ci.org/kianmeng/webservice-swapi)
[![Coverage Status](https://coveralls.io/repos/kianmeng/webservice-swapi/badge.svg?branch=master)](https://coveralls.io/r/kianmeng/webservice-swapi?branch=master)
[![codecov](https://codecov.io/gh/kianmeng/webservice-swapi/branch/master/graph/badge.svg)](https://codecov.io/gh/kianmeng/webservice-swapi)
[![Kwalitee status](http://cpants.cpanauthors.org/dist/WebService-Swapi.png)](http://cpants.charsbar.org/dist/overview/WebService-Swapi)
[![Cpan license](https://img.shields.io/cpan/l/WebService-Swapi.svg)](https://metacpan.org/release/WebService-Swapi)
[![Cpan version](https://img.shields.io/cpan/v/WebService-Swapi.svg)](https://metacpan.org/release/WebService-Swapi)

# NAME

WebService::Swapi - A Perl module to interface with the Star Wars API
(swapi.co) webservice.

# SYNOPSIS

    use WebService::Swapi;

    $swapi = WebService::Swapi->new;

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

WebService::Swapi is a Perl client helper library for the Star Wars API (swapi.co).

# DEVELOPMENT

Source repo at [https://github.com/kianmeng/webservice-swapi](https://github.com/kianmeng/webservice-swapi).

## Docker

If you have Docker installed, you can build your Docker container for this
project.

    $ docker build -t webservice-swapi .
    $ docker run -it -v $(pwd):/root webservice-swapi bash
    # cpanm --installdeps --notest .

## Milla

Setting up the required packages.

    $ cpanm Dist::Milla
    $ milla listdeps --missing | cpanm

Check you code coverage.

    $ milla cover

Several ways to run the test.

    $ milla test
    $ milla test --author --release
    $ AUTHOR_TESTING=1 RELEASE_TESTING=1 milla test
    $ AUTHOR_TESTING=1 RELEASE_TESTING=1 milla run prove t/01_instantiation.t

Release the module.

    $ milla build
    $ milla release

# METHODS

## new(\[%$args\])

Construct a new WebService::Swapi instance. Optionally takes a hash or hash reference.

    # Instantiate the class.
    my $swapi = WebService::Swapi->new;

### api\_url

The URL of the API resource.

    # Instantiate the class by setting the URL of the API endpoints.
    my $swapi = WebService::Swapi->new({api_url => 'http://example.com/api/'});

## get\_object($object, \[$format\])

Get full details of a object or resource. Optionally takes a returned format.

    # Get the details of different available object using id.
    my $object = $swapi->get_object('films', '1');

    # Get the result in different format.
    my $object_json = $swapi->get_object('films', '1', 'json');
    my $object_wookie = $swapi->get_object('films', '1', 'wookiee');

## ping()

Check if the API service or server is responding to a request.

    my $server_status = $swapi->ping();

## resources(\[$format\])

List down all the available objects. Optionally takes a returned format.

    # Get all available resources or objects.
    my $resources = $swapi->resources();

    # Similarly but in different format.
    my $resources_json = $swapi->resources('json');
    my $resources_wookie = $swapi->resources('wookie');

## schema($object)

Show the data structure of a resource or object.

    # Get the schema / structure of a resource or object.
    my $schema = $swapi->schema('people');

## search($object, $keyword, \[$format\])

Searching by keywords. Takes both an object and keywords. Optionally takes a returned format.

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
