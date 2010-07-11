package Hobocamp::Dialog;

use strict;
use warnings;

use Moose;

use Curses qw();
use Text::Wrap qw();

extends 'Hobocamp::Element';

has 'title' => (is => 'rw', 'isa' => 'Str');
has 'scale' => (is => 'rw', 'isa' => 'Bool');
has 'text' => (is => 'rw', 'isa' => 'Str');

has 'window' => (is => 'rw', 'isa' => 'Hobocamp::Window');

sub draw {
    my ($self) = @_;

    my $width = $self->window->max_x / 2;
    my $height = $self->window->max_y / 2;
    my $x = $self->window->max_x / 4;
    my $y = $self->window->max_y / 4;

    if (length($self->text) > $width) {
        local $Text::Wrap::columns = $width - 2;
        $self->text(Text::Wrap::wrap('', '', $self->text));
    }

    my $w = Curses::newwin($height,
                           $width,
                           $y,
                           $x);

    Curses::addstr($w, $y + 1, $x + 1, $self->text);
    Curses::box($w, 0, 0);
    Curses::refresh($w);
}

1;
