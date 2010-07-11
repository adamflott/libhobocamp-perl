package Hobocamp::Element;

use Moose;

has 'x' => (is => 'rw', isa => 'Int', default => 0);
has 'y' => (is => 'rw', isa => 'Int', default => 0);
has 'z' => (is => 'rw', isa => 'Int', default => 0);

1;
