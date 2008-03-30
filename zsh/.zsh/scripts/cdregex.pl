#!/usr/bin/perl
#
# Prints a directory to STDOUT to be caught by `cd' command

use strict;

my $regex = shift;
my @dirs;
my $cdhist = $ENV{'cdhist'} || exit;

if ((not -e $cdhist) || ($regex eq '')) {
    print ".\n";
    exit;
}

open(F, "<$cdhist") || die "Failed to read $cdhist file: $!";
my @paths = <F>;
close(F);

# Strip carriage returns off paths
foreach (@paths) { chomp; s/\r//; }

@paths = grep /$regex/, @paths;

if (!@paths) {
    print STDERR "Not found.\n";
    print ".\n";
} elsif (@paths == 1) {
    print $paths[0], "\n";
} else {
    my $index;
    my $selection = 0;
    my $path;
    my ($rows, $cols) = get_window_size();
    $rows-=2;
    while ($selection <= 0) {
        $index = 1;
        foreach $path (@paths) {
            print STDERR "$index: $path\n";
            $index++;
            if ($index >= $rows) {
                print STDERR "Too many entries [", scalar(@paths), "] . . .\n";
                last;
            }
        }
        print STDERR "selection> ";
        $selection = <>;
    }
    if ($selection <= @paths) {
        print STDERR $paths[$selection-1], "\n";
        print $paths[$selection-1], "\n";
    } else {
        print ".\n";
    }
}

exit;

sub get_window_size {
  my ($rows, $cols) = (24,80);
  my $line;
  if (open(WINDOWSIZE, "stty -a |")) {
      foreach $line (<WINDOWSIZE>) {
          chomp($line);
          if ($line =~ /rows\s+(\d+)/) { $rows = $1; }
          if ($line =~ /columns\s+(\d+)/) { $cols = $1; }
      }
      close(WINDOWSIZE);
  }
  return ($rows, $cols);
}
