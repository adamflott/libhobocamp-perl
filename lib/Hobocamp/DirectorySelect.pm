package Hobocamp::DirectorySelect;

use v5.12.2;
use warnings;

# ABSTRACT: Widget to select a directory

use Moose;

with qw(Hobocamp::Role::Widget Hobocamp::Role::Window);

use Hobocamp::Dialog;

has 'path' => (
    'is'      => 'rw',
    'isa'     => 'Str',
    'default' => ''
);

sub run {
    my ($self) = @_;

    my $retcode = Hobocamp::Dialog::dialog_dselect($self->title, $self->path, $self->height, $self->width);

    $self->value($self->_get_user_input_result());

    return $retcode;
}

1;

=head1 DESCRIPTION

Use this widget to browse for a directory.
