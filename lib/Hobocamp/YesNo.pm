package Hobocamp::YesNo;

use v5.12.2;
use warnings;

# ABSTRACT: yes or no prompt

use Moose;

with qw(Hobocamp::Role::Widget Hobocamp::Role::Window);

use Hobocamp::Dialog;

sub run {
    my ($self) = @_;

    my $retcode = Hobocamp::Dialog::dialog_yesno($self->title, $self->prompt, $self->height, $self->width);

    $self->value($self->_get_user_input_result());

    return $retcode;
}

1;

=head1 DESCRIPTION

A yes or no prompt.
