#!/usr/bin/env perl

use strict;

my @ch = qw/0 1 2 3 4 5 6 7 8 9 a b c d e f g h i j k l m n o p q r s t u v w y z A B C D E F G H I J K L M N O P Q R S T U V W Y Z/;
my $ch_len = @ch;
my $pass = undef;
my $pass_len = $ARGV[0];

unless( $pass_len > 0 ) { $pass_len = 8 }

$pass .= $ch[ int (rand ($ch_len)) ]    for 0 .. ($pass_len - 1);

print $pass, "\n";
