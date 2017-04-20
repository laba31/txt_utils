#!/usr/bin/env perl

use strict;

my $pass = undef;
my $length = $ARGV[0];

unless( $length > 0 ) { $length = 8 }

for(my $i = 0; $i < $length; $i++) {
    my $randletter = (int (rand (26)) + (int (rand (1) + .5) % 2 ? 65 : 97));
    $pass .= sprintf("%c", $randletter);
}

print $pass, "\n";
