package Hobocamp::TextBox;

use v5.12.2;
use warnings;

# ABSTRACT: Widget to display and edit the contents of a file

use Moose;

with qw(Hobocamp::Role::Widget Hobocamp::Role::Window);

use Hobocamp::Dialog;

has 'file' => (
    'is'      => 'ro',
    'isa'     => 'Str',
    'default' => ''
);

sub run {
    my ($self) = @_;

    my $retcode = Hobocamp::Dialog::dialog_textbox($self->title, $self->file, $self->width, $self->height);

    $self->value($self->_get_user_input_result());

    return $retcode;
}

1;

=head1 DESCRIPTION

Edit the contents of a file.
