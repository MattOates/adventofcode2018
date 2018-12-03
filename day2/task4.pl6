#!/usr/bin/env perl6

sub character_differences(Str $str1, Str $str2) {
    $str1.comb Z~~ $str2.comb
}

sub hamming_distance(Str $str1, Str $str2) {
    my @differences = character_differences($str1, $str2);
    return @differences.grep(* == False).elems;
}

sub letters_the_same(Str $str1, Str $str2) {
    my @differences = character_differences($str1, $str2);
    my @positions_common = @differences.pairs.grep(*.value == True).map(*.key);
    return @positions_common.map({$str1.substr($_, 1)}).join('')
}

for lines().combinations: 2 -> ($id1, $id2) {
    if hamming_distance($id1, $id2) == 1 {
        say letters_the_same($id1, $id2);
    }
}
