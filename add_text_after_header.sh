#!/usr/bin/env perl

use strict;

# text for inserting after header
my $text = "\n\nexit;\n\n";

# temporary file
my $new_file = $ARGV[0] . '.NEW';
# file for inserting
my $orig_file = $ARGV[0];

# redirecting stdout to file, I am lazy.
open STDOUT, '>', $new_file or die "Can't redirect STDOUT: $!";

# main loop
while (my $line = <>) {
    # skip header - each line start with -- comment
    if( $line =~ /^--/) {
                print $line;
                next;
        }
        print $text;

        # necessarily
        print $line;
        last;
}

# rest of file
while (<>) { print $_; }

close(STDOUT);

rename $new_file, $orig_file;

