/// {@template meno_size}
/// Enum for all the sizes
/// {@endtemplate}
enum MenoSize {
  /// Micro button size
  xs,

  /// Small button size
  sm,

  /// Default button size
  md,

  /// Large button size
  lg,
}

/// Extension for MenoSize
extension MenoSizeX on MenoSize {
  /// Returns a the normalized name for each valuue
  String get toName {
    return switch (this) {
      MenoSize.xs => 'Micro',
      MenoSize.sm => 'Small',
      MenoSize.md => 'Medium (Default)',
      MenoSize.lg => 'Large',
    };
  }
}
