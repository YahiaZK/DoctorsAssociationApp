import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckmarkRow extends StatelessWidget {
  const CheckmarkRow({super.key, required this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: SvgPicture.asset(
            'assets/icons/checkmark.svg',
            width: 10,
            height: 10,
          ),
        ),
        Expanded(child: title),
      ],
    );
  }
}
