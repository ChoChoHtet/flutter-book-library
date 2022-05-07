import 'package:book_library/resource/dimen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          size: normalIconSize,
          color: Colors.black54,
        ),
      ),
      body: Center(
        child: Text("Search page"),
      ),
    );
  }
}