package Hobocamp::Pause;

use v5.12.2;
use warnings;

# ABSTRACT: Timed message box widget

use Moose;

with qw(Hobocamp::Role::Widget Hobocamp::Role::Window);

use Hobocamp::Dialog;

has 'seconds' => (
    'is'      => 'ro',
    'isa'     => 'Int',
    'default' => 10
);

sub run {
    my ($self) = @_;

    $self->redraw();

    my $retcode = Hobocamp::Dialog::dialog_pause($self->title, $self->prompt, $self->height, $self->width, $self->seconds);

    $self->value(undef);

    return $retcode;
}

1;

=head1 DESCRIPTION

Display a message box for a specified duration (defaults to 10 seconds). No user
input.
