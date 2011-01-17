package Hobocamp::RadioList;

use v5.12.2;
use warnings;

# ABSTRACT: Radio box widget

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

has 'list_height' => (
    'is'      => 'rw',
    'isa'     => 'Int',
    'default' => 1
);

sub run {
    my ($self) = @_;

    my ($retcode, @s) = Hobocamp::Dialog::dialog_checklist($self->title, $self->prompt, $self->height, $self->width, $self->list_height, $self->items, 0);

    my @selected;
    foreach my $i (@s) {
        push(@selected, $self->get_item($i));
    }

    if (@selected) {
        $self->value(\@selected);
    }

    return $retcode;
}

1;

=head1 DESCRIPTION

A radio list widget.
