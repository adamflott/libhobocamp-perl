package Hobocamp::TimeBox;

use v5.10;
use warnings;

# ABSTRACT: Time widget

use Moose;

with qw(Hobocamp::Role::Widget Hobocamp::Role::Window);

use Hobocamp::Dialog;

has 'hour' => (
    'is'      => 'ro',
    'isa'     => 'Int',
    'default' => '12'
);

has 'minute' => (
    'is'      => 'ro',
    'isa'     => 'Int',
    'default' => '00'
);

has 'second' => (
    'is'      => 'ro',
    'isa'     => 'Int',
    'default' => '00'
);

sub run {
    my ($self) = @_;

    my $retcode = Hobocamp::Dialog::dialog_timebox($self->title, $self->prompt, $self->width, $self->height, $self->hour, $self->minute, $self->second);

    $self->value($self->_get_user_input_result());

    return $retcode;
}

1;

=head1 DESCRIPTION

Enter time (hours, minutes, and seconds) widget.
