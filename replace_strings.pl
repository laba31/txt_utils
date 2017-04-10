#!/usr/bin/env perl

use strict;

# temporary file
my $new_file = $ARGV[0] . '.NEW';
# file for replacing strings
my $orig_file = $ARGV[0];

# this hash may be candidate for extra file
my %remap = (
        "oracle_schema\\.table" => "NEW_SCHEMA.TABLE2",
        "hippo\\.account"  => "ELEPHANT.ACC",
        "\t"             => "    "
);

# redirecting stdout to file, I am lazy.
open STDOUT, '>', $new_file or die "Can't redirect STDOUT: $!";

# main loop
while(<>) {
    for my $k (keys %remap) {
        s/$k/$remap{$k}/gi;
    }

    print $_;
}

close(STDOUT);
rename $new_file, $orig_file;

