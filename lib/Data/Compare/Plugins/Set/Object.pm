package Data::Compare::Plugins::Set::Object;

# ABSTRACT: plugin for Data::Compare to handle Set::Object objects

=head1 DESCRIPTION

Enables L<Data::Compare|Data::Compare> to Do The Right Thing for
L<Set::Object|Set::Object> objects. Set::Object already has an
C<equals()> method, but it only returns true if objects within two sets
are exactly equal (i.e. have the same references, referring to the same
object instance).  When using Data::Compare in conjunction with this
plugin, objects in sets are considered the same if their B<contents> are
the same.  This extends down to sets that contain arrays, hashes, or
other objects supported by Data::Compare plugins.

=cut

use 5.010;
use utf8;
use strict;
use warnings;

# VERSION
use English '-no_match_vars';
use Data::Compare 0.06;
use List::Util 'first';

sub _register {
    return [ 'Set::Object', \&_so_set_compare ];
}

## no critic (Subroutines::RequireArgUnpacking)
sub _so_set_compare {
    my @sets = splice @_, 0, 2;

    # quick optimizations if sets aren't of equal size or are directly equal
    return 0 if $sets[0]->size() != $sets[1]->size();
    return 1 if $sets[0] == $sets[1];

    # loop over each of the first set's elements
    # looking for a match in the second set
    for my $element ( $sets[0]->elements() ) {
        my $matched_element = first { Data::Compare::Compare( $element, $_ ) }
        grep { ref eq ref $element } $sets[1]->elements();

        # return false if not found
        return 0 if not defined $matched_element;

        # otherwise remove from copy of second set and keep going
        $sets[1]->remove($matched_element);
    }

    # sets are equal only if we've exhausted the second set
    return $sets[1]->is_null();
}

# Data::Compare::Plugins interface requires modules to return an arrayref
## no critic (RequireEndWithOne, Lax::RequireEndWithTrueConst)
_register();

__END__

=head1 SYNOPSIS

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

=head1 SUBROUTINES/METHODS

As a plugin to Data::Compare, the interface is the same as Data::Compare
itself: pass the reference to two data structures to the C<Compare>
function, which for historical reasons is exported by default.

Set::Object also can export certain functions, and overloads comparison
operators pertaining to sets.  Consult the
L<Set::Object documentation|Set::Object> for more information.
