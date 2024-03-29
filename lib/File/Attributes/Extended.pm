package File::Attributes::Extended;

=head1 NAME

File::Attributes::Extended - Implementation of File::Attributes
using extended attributes

=head1 SYNOPSIS

XXX

=head1 DESCRIPTION

XXX

=cut

use strict;
use warnings;
use base qw(File::Attributes::Base);
use File::ExtAttr 1.01 qw(getfattr setfattr delfattr listfattr);

our $VERSION = '0.01';

sub applicable {
    # XXX: OS check; probably needs some helper function in File::ExtAttr.
    # But using what context? This may be path-dependent.
    #
    # For now, just assume that it's support on the operating systems
    # that File::ExtAttr 1.0.1 supports.
    my %supported = (
        'linux' => 1,
        'darwin' => 1, # Mac OS X
        'freebsd' => 1,
        'openbsd' => 1,
        # NetBSD?
        'solaris' => 1,
    );

    return $supported{$^O} || 0;
}

sub get
{
    my $self = shift;
    my $file = shift;
    my $attr = shift;

    # XXX: This requires File::ExtAttr to support exceptions.
    return getfattr($file, $attr);
}

sub set
{
    my $self = shift;
    my $file = shift;
    my $attr = shift;
    my $value = shift;

    # XXX: This requires File::ExtAttr to support exceptions.
    return setfattr($file, $attr, $value);
}

sub unset
{
    my $self = shift;
    my $file = shift;
    my $attr = shift;

    # XXX: This requires File::ExtAttr to support exceptions.
    return delfattr($file, $attr);
}

sub list
{
    my $self = shift;
    my $file = shift;

    # XXX: This requires File::ExtAttr to support exceptions.
    return listfattr($file);
}

=head1 AUTHOR

Richard Dawe, E<lt>rich@phekda.gotadsl.co.ukE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2006 by Richard Dawe

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.5 or,
at your option, any later version of Perl 5 you may have available.

=cut

1;
__END__
