package Hobocamp::Window;

use Moose;

use Curses qw();

has 'title' => (is => 'rw', 'isa' => 'Str');
has 'scale' => (is => 'rw', 'isa' => 'Bool');

has 'max_x' => (is => 'rw', 'isa' => 'Int');
has 'max_y' => (is => 'rw', 'isa' => 'Int');

has 'background_color' => (is => 'rw', 'isa' => 'Int', default => Curses::COLOR_BLUE);
has 'foreground_color' => (is => 'rw', 'isa' => 'Int', default => Curses::COLOR_BLACK);

sub BUILD {
    my ($self) = @_;

    # start curses
    Curses::initscr();

    # pass in signals
    #Curses::raw();

    # don't echo back characters
    Curses::noecho();

    if (Curses::has_colors()) {
        Curses::start_color();
    }

    $self->calc_max();
}

sub calc_max {
    my ($self) = @_;

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
