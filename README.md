[![Build Status](https://travis-ci.org/kianmeng/webservice-swapi.svg?branch=master)](https://travis-ci.org/kianmeng/webservice-swapi)
# NAME

Webservice::Swapi - It's Perl module to interface with the Star Wars API (swapi.co) webservice.

# SYNOPSIS

    use Webservice::Swapi;

# DESCRIPTION

Webservice::Swapi is a Perl client helper library for the Star Wars API (swapi.co).

# DEVELOPMENT

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

Copyright (C) Kian-Meng, Ang.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

Kian-Meng, Ang <kianmeng@users.noreply.github.com>
