class Rectangle {
    has int $!id;
    has int $!x;
    has int $!y;
    has int $!width;
    has int $!height;

}

grammar ClothOrders {
    rule TOP { <order>* }
    rule order { '#' <id> '@' <x> ',' <y> ':' <width> 'x' <height>}
    token id { \d+ }
    token x { \d+ }
    token y { \d+ }
    token width { \d+ }
    token height { \d+ }
}

class ClothOrderActions {
    method order($/) {
        make Rectangle.new(id=>$<id>);
    }
}

my @orders = ClothOrders.parse('input.txt', actions=>ClothOrderActions);
say @orders;
