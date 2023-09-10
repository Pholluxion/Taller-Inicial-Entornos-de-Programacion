extension FromString on String {
  String padding(int padding) =>
      ' '.padLeft(padding) + this + ' '.padRight(padding);

  int toInt() => int.tryParse(this) ?? 0;
}
