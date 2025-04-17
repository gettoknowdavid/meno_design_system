import 'package:flutter/material.dart';

/// {@template destination}
/// Destination
/// {@endtemplate}
@immutable
final class Destination {
  /// {@macro destination}
  const Destination({required this.icon, required this.label});

  /// Destination icon
  final Widget icon;

  /// Destination label
  final String label;
}
