
sub number_with_repeat(Str $id, Int $repeat) {
    return $id.comb.Bag.grep(*.value == $repeat).elems > 0;
}

my $twos = 0;
my $threes = 0;

for lines() -> $id {
    $twos += number_with_repeat($id, 2);
    $threes += number_with_repeat($id, 3);
}

say "$twos * $threes = {$twos * $threes}";
