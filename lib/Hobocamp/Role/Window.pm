package Hobocamp::Role::Window;

use v5.12.2;
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

sub redraw {
    if (shift->backtitle) {
        Hobocamp::Dialog::dlg_put_backtitle();
    }

    return;
}

no Moose::Role;

1;
