package Hobocamp::Role::Widget;

use v5.12.2;
use warnings;

# ABSTRACT: A role for all widgets

use Moose::Role;

requires 'run';

use Hobocamp::Dialog;

has 'title' => (
    'is'      => 'ro',
    'isa'     => 'Str',
    'default' => '',
);

has 'prompt' => (
    'is'      => 'ro',
    'isa'     => 'Str',
    'default' => '',
);

has 'width' => (
    'is'      => 'rw',
    'isa'     => 'Int',
    'default' => 0
);

has 'height' => (
    'is'      => 'rw',
    'isa'     => 'Int',
    'default' => 0
);

has 'value' => (
    'is'  => 'rw',
    'isa' => 'Any',
);

sub hide {
    return Hobocamp::Dialog::dlg_clear();
}

sub show {
    return shift->run(@_);
}

sub _get_user_input_result {
    my ($self) = @_;

    return Hobocamp::Dialog::_dialog_result();
}

no Moose::Role;

1;

=head1 SYNOPSIS

    package Some::Thing;

    use Moose;

    with 'Hobocamp::Role::Widget';

=head1 DESCRIPTION

Provides information and functionality to any of dialog's widgets.
