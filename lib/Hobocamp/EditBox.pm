package Hobocamp::EditBox;

use v5.10;
use warnings;

# ABSTRACT: Widget to edit text in a file

use Moose;

with qw(Hobocamp::Role::Widget Hobocamp::Role::Window);

use Hobocamp::Dialog;

has 'file' => (
    'is'      => 'rw',
    'isa'     => 'Str',
    'default' => ''
);

sub run {
    my ($self) = @_;

    my $retcode = Hobocamp::Dialog::dialog_editbox($self->title, $self->file, $self->height, $self->width);

    $self->value($self->_get_user_input_result());

    return $retcode;
}

1;

=head1 DESCRIPTION

Use this widget to edit text in a file.
