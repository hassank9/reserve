int getColorFromString1(String hexString) {
  return int.parse(hexString.substring(2), radix: 16);
}

getColorFromString2(String hexString) {
  return int.parse(hexString.substring(2), radix: 16).toRadixString(16);
}
