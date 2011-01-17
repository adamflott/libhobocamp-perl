package Hobocamp::InputBox;

use v5.12.2;
use warnings;

# ABSTRACT: text input widget

use Moose;

with qw(Hobocamp::Role::Widget Hobocamp::Role::Window);

use Hobocamp::Dialog;

has 'init' => (
    'is'      => 'rw',
    'isa'     => 'Str',
    'default' => ''
);

has 'is_password_field' => (
    'is'      => 'ro',
    'isa'     => 'Bool',
    'default' => 0
);

sub run {
    my ($self) = @_;

    my $retcode = Hobocamp::Dialog::dialog_inputbox($self->title, $self->prompt, $self->width, $self->height, $self->init, $self->is_password_field);

    $self->value($self->_get_user_input_result());
    $self->init($self->value);

    return $retcode;
}

1;

=head1 DESCRIPTION

Single line input widget.
