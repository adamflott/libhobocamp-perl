package Hobocamp::Role::Widget;

use v5.10;
use warnings;

# ABSTRACT: A role for all widgets

use Moose::Role;

requires 'run';

use Hobocamp::Dialog;

# core
use Scalar::Util qw();

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

has 'auto_scale' => (
    'is'      => 'rw',
    'isa'     => 'Bool',
    'default' => 1
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

before 'run' => sub {
    my ($self) = @_;

    return unless ($self->auto_scale);

    given (Scalar::Util::blessed($self)) {
        when ('Hobocamp::Menu') {
            $self->menu_height(scalar(@{$self->items}));
        }
    }
};

no Moose::Role;

1;

=head1 SYNOPSIS

    package Some::Thing;

    use Moose;

    with 'Hobocamp::Role::Widget';

=head1 DESCRIPTION

Provides information and functionality to any of dialog's widgets.
