package Hobocamp::FileSelect;

use v5.10;
use warnings;

# ABSTRACT: Widget to select a file

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

    my $retcode = Hobocamp::Dialog::dialog_fselect($self->title, $self->path, $self->height, $self->width);

    $self->value($self->_get_user_input_result());

    return $retcode;
}

1;

=head1 DESCRIPTION

Use this widget to browse for a directory.
