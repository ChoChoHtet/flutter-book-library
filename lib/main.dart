

import 'package:book_library/data/vos/book_vo.dart';
import 'package:book_library/data/vos/shelf_vo.dart';
import 'package:book_library/page/main_page.dart';
import 'package:book_library/persistence/hive_constant.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookVOAdapter());
  Hive.registerAdapter(ShelfVOAdapter());

  await Hive.openBox<BookVO>(kBoxNameBookVO);
  await Hive.openBox<BookVO>(kBoxNameBookVisited);
  await Hive.openBox<ShelfVO>(kBoxNameShelf);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

