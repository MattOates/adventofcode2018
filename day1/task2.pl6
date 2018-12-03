#!/usr/bin/env perl6

my %frequencies_observed = BagHash.new: 0;
my $current_freq = 0;

sub frequencies() {
    my @frequencies = lines();
    return (0..Inf).map({
        @frequencies[$_ % @frequencies.elems]
    });
}

for frequencies() -> $freq {
    $current_freq += $freq;
    %frequencies_observed{$current_freq}++;
    if %frequencies_observed{$current_freq} >=2 {
        say $current_freq;
    }
}
