import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// {@template meno_snackbar_action}
/// Custom action button for the [MenoSnackBar]
/// {@endtemplate}
class MenoSnackBarAction extends StatefulWidget {
  /// {@macro meno_snackbar_action}
  const MenoSnackBarAction({
    required this.label,
    required this.onPressed,
    super.key,
  });

  /// The button label.
  final String label;

  /// The callback to be called when the button is pressed.
  ///
  /// This callback will be called at most once each time this action is
  /// displayed in a [MenoSnackBar].
  final VoidCallback onPressed;

  @override
  State<MenoSnackBarAction> createState() => _MenoSnackBarActionState();
}

class _MenoSnackBarActionState extends State<MenoSnackBarAction> {
  bool _haveTriggeredAction = false;

  void _handlePressed() {
    if (_haveTriggeredAction) {
      return;
    }
    setState(() {
      _haveTriggeredAction = true;
    });
    widget.onPressed();
    ScaffoldMessenger.of(
      context,
    ).hideCurrentSnackBar(reason: SnackBarClosedReason.action);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _haveTriggeredAction ? null : _handlePressed,
      child: MenoText.micro(widget.label, decoration: TextDecoration.underline),
    );
  }
}
