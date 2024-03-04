enum Format {
  normal,
  large,
  slim,
  mini,
  loose,
}

final formatValues = Map<int, Format>.fromIterable(Format.values,
    key: (v) => v.index, value: (v) => v);

Format? formatFromInt(int number) {
  if (formatValues.containsKey(number)) {
    return formatValues[number];
  } else {
    throw ArgumentError('Invalid format number: $number');
  }
}

int intFromFormat(Format format) {
  return format.index;
}
