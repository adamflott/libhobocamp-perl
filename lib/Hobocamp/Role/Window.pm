package Hobocamp::Role::Window;

use v5.10;
use warnings;

# ABSTRACT: A role for adjusting windows (back title, ASCII lines, etc)

use Moose::Role;

use Hobocamp::Dialog;

has 'backtitle' => (
    'is'      => 'rw',
    'isa'     => 'Str',
    'default' => '',
    'trigger' => sub {
        my ($self, $new, $old) = @_;
        Hobocamp::Dialog::_dialog_set_backtitle($new);
        $self->redraw;
    }
);

has 'ascii_lines' => (
    'is'      => 'rw',
    'isa'     => 'Bool',
    'default' => 0,
);

before 'run' => sub {
    my ($self) = @_;

    Hobocamp::Dialog::_set_ascii_lines_state($self->ascii_lines);
};

sub redraw {
    if (shift->backtitle) {
        Hobocamp::Dialog::dlg_put_backtitle();
    }

    return;
}

no Moose::Role;

1;
