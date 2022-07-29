import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
        color: isActive
            ? const Color.fromARGB(255, 255, 114, 94)
            : const Color.fromARGB(255, 255, 114, 94).withOpacity(0.4),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      duration: const Duration(milliseconds: 300),
    );
  }
}
