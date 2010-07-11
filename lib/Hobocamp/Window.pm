package Hobocamp::Window;

use Moose;

use Curses qw();

has 'title' => (is => 'rw', 'isa' => 'Str');
has 'scale' => (is => 'rw', 'isa' => 'Bool');

has 'max_x' => (is => 'rw', 'isa' => 'Int');
has 'max_y' => (is => 'rw', 'isa' => 'Int');

sub BUILD {
    my ($self) = @_;

    # start curses
    Curses::initscr();

    # pass in signals
    #Curses::raw();

    # don't echo back characters
    Curses::noecho();

    my ($x, $y);
    Curses::getmaxyx($y, $x);

    $self->max_x($x);
    $self->max_y($y);
}

sub add {
    my ($self, $d) = @_;
    $d->window($self);
    $d->draw;
}

1;
