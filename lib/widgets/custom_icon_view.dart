

import 'package:book_library/resource/dimen.dart';
import 'package:flutter/material.dart';

class CustomIconView extends StatelessWidget{
  final String image;

  const CustomIconView({Key? key,required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Image.asset(image,),
    );
  }
}