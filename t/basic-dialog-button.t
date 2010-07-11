#!/usr/bin/env perl

use strict;
use warnings;

use Hobocamp;
use Hobocamp::Window;
use Hobocamp::Dialog;

my $win = Hobocamp::Window->new;

$win->add(Hobocamp::Dialog->new('title' => 'what up?', 'text' => 'blah', 'type' => 'yesno'));

Hobocamp->run;
