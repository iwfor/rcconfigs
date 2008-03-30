#!/usr/bin/perl

use strict;

# Don't proceed if no path given
exit if !scalar(@ARGV);

my $path = shift;
my $cdhist = $ENV{'cdhist'} || exit;
srand(time ^ $$);

# Read the existing file
my @inlines;
if (-e $cdhist) {
    open(F,"<$cdhist") || die "Failed to read $cdhist: $!\n";
    @inlines = <F>;
    close(F);
}

# Prepend the new path
my %flist;
my $i = 0;
open(F,">$cdhist") || die "Failed to write $cdhist: $!\n";
if (-d $path) {
    $flist{$path} = 1;
    print F "$path\n";
}
foreach $path (@inlines) {
    last if ($i >= 1000);
    chomp $path;
    $path =~ s/\r//;
    next if (exists $flist{$path});
    # Spot check old directories to make sure they exist
    if (!(int(rand(20)))) {
        next if (not -d $path);
    }
    $flist{$path} = 1;
    print F "$path\n";
    $i++;
}
close(F);
