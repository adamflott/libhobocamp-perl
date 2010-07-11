package Hobocamp::Element;

use Moose;

has 'x' => (is => 'rw', isa => 'Int', default => 0);
has 'y' => (is => 'rw', isa => 'Int', default => 0);
has 'z' => (is => 'rw', isa => 'Int', default => 0);

has 'background_color' => (is => 'rw', 'isa' => 'Int');
has 'foreground_color' => (is => 'rw', 'isa' => 'Int');

1;
