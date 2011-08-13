package Hobocamp::Calendar;

use v5.10;
use warnings;

# ABSTRACT: calendar widget

use Moose;

with qw(Hobocamp::Role::Widget Hobocamp::Role::Window);

use Hobocamp::Dialog;

has 'day' => (
    'is'      => 'ro',
    'isa'     => 'Int',
    'default' => '1'
);

has 'month' => (
    'is'      => 'ro',
    'isa'     => 'Int',
    'default' => '1'
);

has 'year' => (
    'is'      => 'ro',
    'isa'     => 'Int',
    'default' => '1970'
);

sub run {
    my ($self) = @_;

    my $retcode = Hobocamp::Dialog::dialog_calendar($self->title, $self->prompt, $self->width, $self->height, $self->day, $self->month, $self->year);

    $self->value($self->_get_user_input_result());

    return $retcode;
}

1;

=head1 DESCRIPTION

A widget to choose a date.
