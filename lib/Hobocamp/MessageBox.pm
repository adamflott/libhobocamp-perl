package Hobocamp::MessageBox;

use v5.12.2;
use warnings;

# ABSTRACT: Message box widget

use Moose;

with qw(Hobocamp::Role::Widget Hobocamp::Role::Window);

use Hobocamp::Dialog;

has 'pause' => (
    'is'      => 'ro',
    'isa'     => 'Bool',
    'default' => 1
);

sub run {
    my ($self) = @_;

    $self->redraw();

    my $retcode = Hobocamp::Dialog::dialog_msgbox($self->title, $self->prompt, $self->height, $self->width, $self->pause);

    $self->value(undef);

    return $retcode;
}

1;

=head1 DESCRIPTION

Display a message box. No user input.
