[![Build Status](https://travis-ci.org/kianmeng/webservice-swapi.svg?branch=master)](https://travis-ci.org/kianmeng/webservice-swapi)
# NAME

Webservice::Swapi - A Perl module to interface with the [Star Wars API](http://swapi.co) webservice.

# SYNOPSIS

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

# DESCRIPTION

Webservice::Swapi is a Perl client helper library for the [Star Wars API](http://swapi.co).

# DEVELOPMENT

Source repo at [https://github.com/kianmeng/webservice-swapi:https://github.com/kianmeng/webservice-swapi](https://github.com/kianmeng/webservice-swapi:https://github.com/kianmeng/webservice-swapi).

To setup the development environment.

    $ cpanm -nq --installdeps --with-develop --with-recommends .

Or using Carton.

    $ carton install

Run these commands to developer, test, and release.

    $ minil test
    $ FAKE_RELEASE=1 minil release

Or using Cargon (faster).

    $ carton exec -- prove -Ilib -r t

# LICENSE

Copyright 2017 (C) Kian-Meng, Ang.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

Kian-Meng, Ang <kianmeng@users.noreply.github.com>
