#!/usr/bin/env perl

use strict;
use warnings;

use Hobocamp;
use Hobocamp::Window;
use Hobocamp::Dialog;

my $win = Hobocamp::Window->new->add(Hobocamp::Dialog->new('text' => 'Hello World!'));

Hobocamp->run;
