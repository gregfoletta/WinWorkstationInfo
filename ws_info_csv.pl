#!/usr/bin/env perl

use strict;
use warnings;
use 5.010;
use Getopt::Long;
use Pod::Usage;
use Carp;
use English qw( -no_match_vars );

=head1 NAME

ws_info_.pl - Converts numerous Windows command line outputs to CSV.

=head1 SYNOPSIS

./ws_info.pl [options] <file_1> ... <file_n>

=head2 OPTIONS

=over 4

=back

=head1 DESCRIPTION

B<ws_info_csv.pl> converts Windows outputs to a CSV file.

=cut

my %args;

GetOptions(\%args,
    "help" => sub { pod2usage(1) }
) or pod2usage(2);


main(%args);


sub main {
    my (%args) = @_;
    my @files = @ARGV;

    die "No files specified\n" if !@files;

    for my $file (@files) {
        open(my $fh, '<:encoding(UTF-8)', $file) or die "Could not open $file"; 

        $INPUT_RECORD_SEPARATOR = "--------";

        while (my $section = <$fh>) {
            chomp $section;
            use Data::Dumper;
            print Dumper $section;
        }
    }
}


