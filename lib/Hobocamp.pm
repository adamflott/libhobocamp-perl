package Hobocamp;

use Moose;

use AnyEvent;
use Curses qw();

my $w = AnyEvent->signal(signal => "TERM", cb => sub { die });

sub run {
    my $w2 = AnyEvent->condvar;
    $w2->recv;
}

END {
    Curses::endwin();
}

1;
