package Hobocamp::Menu;

use v5.10;
use warnings;

# ABSTRACT: select 1 item from a list

use Moose;

with qw(Hobocamp::Role::Widget Hobocamp::Role::Window);

use Hobocamp::Dialog;

has 'items' => (
    'traits'  => ['Array'],
    'is'      => 'rw',
    'isa'     => 'ArrayRef[HashRef]',
    'default' => sub { [] },
    'handles' => {
        'add_item'  => 'push',
        'all_items' => 'elements',
        'get_item'  => 'get',
    }
);

has 'menu_height' => (
    'is'      => 'rw',
    'isa'     => 'Int',
    'default' => 1
);

sub run {
    my ($self) = @_;

    my ($retcode, $selected) = Hobocamp::Dialog::dialog_menu($self->title, $self->prompt, $self->height, $self->width, $self->menu_height, $self->items);

    if ($self->get_item($selected)) {
        $self->value($self->get_item($selected));
    }

    return $retcode;
}

1;

=head1 DESCRIPTION

Select 1 item from a list
