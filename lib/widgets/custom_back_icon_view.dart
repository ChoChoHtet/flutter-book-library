import 'package:flutter/material.dart';

import '../resource/dimen.dart';

class CustomBackIconView extends StatelessWidget {
  final VoidCallback onTapBack;

  const CustomBackIconView({
    Key? key,
    required this.onTapBack,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapBack,
      child: const Icon(
        Icons.arrow_back_ios,
        size: normalIconSize,
        color: Colors.black54,
      ),
    );
  }
}
