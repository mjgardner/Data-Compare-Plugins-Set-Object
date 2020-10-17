# NAME

Data::Compare::Plugins::Set::Object - plugin for Data::Compare to handle Set::Object objects

# VERSION

version 1.002

# SYNOPSIS

    use 5.010;
    use Set::Object 'set';
    use Data::Compare;

    my $foo = {
        list => [ qw(one two three) ],
        set  => set( [1], [2], [3] ),
    };
    my $bar = {
        list => [ qw(one two three) ],
        set  => set( [1], [2], [3] ),
    };

    say 'Sets in $foo and $bar are ',
        $foo->{set} == $bar->{set} ? '' : 'NOT ', 'identical.';
    say 'Data within $foo and $bar are ',
        Compare($foo, $bar) ? '' : 'NOT ', 'equal.';

# DESCRIPTION

Enables [Data::Compare](https://metacpan.org/pod/Data%3A%3ACompare) to Do The Right Thing for
[Set::Object](https://metacpan.org/pod/Set%3A%3AObject) objects. Set::Object already has an
`equals()` method, but it only returns true if objects within two sets
are exactly equal (i.e. have the same references, referring to the same
object instance).  When using Data::Compare in conjunction with this
plugin, objects in sets are considered the same if their **contents** are
the same.  This extends down to sets that contain arrays, hashes, or
other objects supported by Data::Compare plugins.

# SUBROUTINES/METHODS

As a plugin to Data::Compare, the interface is the same as Data::Compare
itself: pass the reference to two data structures to the `Compare`
function, which for historical reasons is exported by default.

Set::Object also can export certain functions, and overloads comparison
operators pertaining to sets.  Consult the
[Set::Object documentation](https://metacpan.org/pod/Set%3A%3AObject) for more information.

# SUPPORT

## Perldoc

You can find documentation for this module with the perldoc command.

    perldoc Data::Compare::Plugins::Set::Object

## Websites

The following websites have more information about this module, and may be of help to you. As always,
in addition to those websites please use your favorite search engine to discover more resources.

- CPANTS

    The CPANTS is a website that analyzes the Kwalitee ( code metrics ) of a distribution.

    [http://cpants.cpanauthors.org/dist/Data-Compare-Plugins-Set-Object](http://cpants.cpanauthors.org/dist/Data-Compare-Plugins-Set-Object)

- CPAN Testers

    The CPAN Testers is a network of smoke testers who run automated tests on uploaded CPAN distributions.

    [http://www.cpantesters.org/distro/D/Data-Compare-Plugins-Set-Object](http://www.cpantesters.org/distro/D/Data-Compare-Plugins-Set-Object)

- CPAN Testers Matrix

    The CPAN Testers Matrix is a website that provides a visual overview of the test results for a distribution on various Perls/platforms.

    [http://matrix.cpantesters.org/?dist=Data-Compare-Plugins-Set-Object](http://matrix.cpantesters.org/?dist=Data-Compare-Plugins-Set-Object)

- CPAN Testers Dependencies

    The CPAN Testers Dependencies is a website that shows a chart of the test results of all dependencies for a distribution.

    [http://deps.cpantesters.org/?module=Data::Compare::Plugins::Set::Object](http://deps.cpantesters.org/?module=Data::Compare::Plugins::Set::Object)

## Bugs / Feature Requests

Please report any bugs or feature requests through the web
interface at [https://github.com/mjgardner/Data-Compare-Plugins-Set-Object/issues](https://github.com/mjgardner/Data-Compare-Plugins-Set-Object/issues). You will be automatically notified of any
progress on the request by the system.

## Source Code

The code is open to the world, and available for you to hack on. Please feel free to browse it and play
with it, or whatever. If you want to contribute patches, please send me a diff or prod me to pull
from your repository :)

[https://github.com/mjgardner/Data-Compare-Plugins-Set-Object](https://github.com/mjgardner/Data-Compare-Plugins-Set-Object)

    git clone git://github.com/mjgardner/Data-Compare-Plugins-Set-Object.git

# AUTHOR

Mark Gardner <mjgardner@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2017 by Mark Gardner.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
