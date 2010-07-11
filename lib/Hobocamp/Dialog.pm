package Hobocamp::Dialog;

use Moose;
use Moose::Util::TypeConstraints;

use Curses qw();
use Text::Wrap qw();

extends 'Hobocamp::Element';

has 'title' => (is => 'rw', 'isa' => 'Str');
has 'scale' => (is => 'rw', 'isa' => 'Bool');
has 'text'  => (is => 'rw', 'isa' => 'Str');

has 'type' => (is => 'rw', 'isa' => enum([qw(ok none yesno okcancel)]), default => 'none');

has 'window' => (is => 'rw', 'isa' => 'Hobocamp::Window');

sub draw {
    my ($self) = @_;

    my $width  = $self->window->max_x / 2;
    my $height = $self->window->max_y / 2;
    my $x      = $self->window->max_x / 4;
    my $y      = $self->window->max_y / 4;

    if (length($self->text) > $width) {
        local $Text::Wrap::columns = $width - 2;
        $self->text(Text::Wrap::wrap('', '', $self->text));
    }

    my $w = Curses::newwin($height, $width, $y, $x);

    Curses::addstr($w, $height / 2, $width / 2, $self->text);
    Curses::box($w, 0, 0);

    if ($self->title) {
        Curses::attron($w, Curses::A_REVERSE);
        Curses::addstr($w, 0, 1, ' ' . $self->title . ' ');
        Curses::attroff($w, Curses::A_REVERSE);
    }

    if (my $t = $self->type) {
        my ($button_x, $button_y, $button_string);

        if ($t eq 'ok') {
            $button_y      = $height - 2;
            $button_x      = $width / 2;
            $button_string = '<   ' . ucfirst($t) . '   >';
        }
        elsif ($t eq 'yesno') {
            $button_y      = $height - 2;
            $button_x      = $width / 2;
            $button_string = '< Yes >' . ' ' x 2 . '< No >';
        }
        my %colors_to_pair;

        # default color 0, can't be changed.
        $colors_to_pair{'white'}{'black'} = 0;

        # define all posisble color
        my $counter                 = 1;
        my %colors_to_curses_colors = (
            black   => Curses::COLOR_BLACK,
            red     => Curses::COLOR_RED,
            green   => Curses::COLOR_GREEN,
            yellow  => Curses::COLOR_YELLOW,
            blue    => Curses::COLOR_BLUE,
            magenta => Curses::COLOR_MAGENTA,
            cyan    => Curses::COLOR_CYAN,
            white   => Curses::COLOR_WHITE,
        );
        my @color = keys %colors_to_curses_colors;
        foreach my $fgcolor (@color) {
            foreach my $bgcolor (@color) {
                $fgcolor eq 'white' && $bgcolor eq 'black'
                  and next;
                Curses::init_pair($counter, $colors_to_curses_colors{$fgcolor}, $colors_to_curses_colors{$bgcolor});
                $colors_to_pair{$fgcolor}{$bgcolor} = Curses::COLOR_PAIR($counter);
                $counter++;
            }
        }
        Curses::attron($w, $colors_to_pair{'black'}->{'blue'});
        Curses::addstr($w, $button_y, $button_x, $button_string);
        Curses::attroff($w, $colors_to_pair{'black'}->{'blue'});
    }

    Curses::refresh($w);
    Curses::attroff(Curses::COLOR_PAIR(1));
}

1;
