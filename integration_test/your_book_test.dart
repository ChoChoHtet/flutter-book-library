import 'package:book_library/resource/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_data/test_data.dart';

Future<void> testYourBook(WidgetTester tester) async{
  var libraryTab = find.byKey(const Key(keyLibraryTab));
  expect(libraryTab, findsOneWidget);
  await tester.tap(libraryTab);
  await tester.pumpAndSettle(const Duration(seconds: 5));

  //verify book
  var book = find.byKey(const Key("$keyYourBook$bookName1"));
  await tester.ensureVisible(book);
  expect(book, findsOneWidget);

  //verify book2
  var book2 = find.byKey(const Key("$keyYourBook$bookName2"));
  await tester.ensureVisible(book2);
  expect(book2, findsOneWidget);

 /* var listIconFinder = find.byKey(const Key(keyGrid));
  expect(listIconFinder, findsOneWidget);

  await tester.tap(listIconFinder);
  await tester.pumpAndSettle(const Duration(seconds: 4));

  var twoGridFinder =  find.byKey(const Key(keyTwoGrid));
  expect(twoGridFinder, findsOneWidget);

  await tester.tap(twoGridFinder);
  await tester.pumpAndSettle(const Duration(seconds: 4));

  //verify book
  var gridBook = find.byKey(const Key("$keyYourBookGrid$bookName1"));
  await tester.ensureVisible(gridBook);
  expect(gridBook, findsOneWidget);

  //verify book2
  var gridBook2 = find.byKey(const Key("$keyYourBookGrid$bookName2"));
  await tester.ensureVisible(gridBook2);
  expect(gridBook2, findsOneWidget);*/


}