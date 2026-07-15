import 'package:flutter/widgets.dart';

class HorizontalSpacing extends StatelessWidget {
  const HorizontalSpacing({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}
