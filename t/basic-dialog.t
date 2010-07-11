#!/usr/bin/env perl

use strict;
use warnings;

use Hobocamp;
use Hobocamp::Window;
use Hobocamp::Dialog;

my $win = Hobocamp::Window->new(
    'scale' => 1,
    'title' => 'test');

$win->add(Hobocamp::Dialog->new('text' => 'test2'));

Hobocamp->run;
