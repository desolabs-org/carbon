class Layout {
  static double boundary = 1024;

  static double marginSmall(double value) =>
      (value > boundary) ? value * 0.01 : 1;

  static double marginLarge(double value) =>
      (value > boundary) ? value * 0.05 : 2;
}