/// Meno Avatar Radius size
enum MenoAvatarRadius {
  /// Radius of 12
  xs(value: 12, iconSize: 12),

  /// Radius of 16
  sm(value: 16, iconSize: 14),

  /// Radius of 20
  md(value: 20, iconSize: 16),

  /// Radius of 24
  lg(value: 24, iconSize: 20),

  /// Radius of 32
  xlg(value: 32, iconSize: 22),

  /// Radius of 36
  xxlg(value: 36, iconSize: 32);

  const MenoAvatarRadius({required this.value, required this.iconSize});

  /// The radius value of the current avatar
  final double value;

  /// Icon size for the current avatar
  final double iconSize;
}
