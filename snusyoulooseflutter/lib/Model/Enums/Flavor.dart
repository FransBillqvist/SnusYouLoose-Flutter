enum Flavor {
  traditional,
  mint,
  wintergreen,
  licorice,
  berry,
  blueberry,
  lingonberry,
  cloudberry,
  blackcurrant,
  blackberry,
  juniper,
  apple,
  cherry,
  citrus,
  lime,
  grapefruit,
  coffee,
  cinnamon,
  cranberry,
  eucalyptus,
  fruit,
  ginger,
  grape,
  honey,
  lemon,
  mango,
  melon,
  watermelon,
  cantaloupe,
  orange,
  peach,
  pear,
  peppermint,
  pineapple,
  raspberry,
  rose,
  strawberry,
  vanilla,
  whiskey,
  wine,
  other,
  apricot,
  pomegranate,
  kiwi,
  passionfruit,
  coconut,
  violet,
  cactus,
  elderflower,
  cola,
  toffee,
  tropical,
  spearmint,
  jalapeno,
}

final flavorValues = Map<int, Flavor>.fromIterable(Flavor.values,
    key: (v) => v.index, value: (v) => v);

Flavor? flavorFromInt(int number) {
  if (flavorValues.containsKey(number)) {
    return flavorValues[number];
  } else {
    throw ArgumentError('Invalid flavor number: $number');
  }
}

int intFromFlavor(Flavor flavor) {
  return flavor.index;
}
