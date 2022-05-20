import 'package:book_library/page/detail_book_page.dart';
import 'package:book_library/page/home_page.dart';
import 'package:book_library/resource/string.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_data/test_data.dart';

Future<void> testAddBookToLibrary(WidgetTester tester) async {
  //verify home page
  expect(find.byType(HomePage), findsOneWidget);
  
  expect(find.byType(CarouselSlider), findsNothing);
  // tap book and add to library
  var bookItem =find.text(bookName1);
  expect(bookItem, findsWidgets);
  await tester.tap(bookItem.first);
  await tester.pumpAndSettle(const Duration(seconds: 5));

  // verify book detail appear
  expect(find.byType(DetailBookPage), findsWidgets);
  expect(bookItem, findsOneWidget);
  expect(find.text(bookAuthorName1), findsOneWidget);

  //tap back button
  var backButton = find.byKey(const Key(keyBookDetailBack),skipOffstage: true);
  expect(backButton, findsOneWidget);
  await tester.tap(backButton);
  await tester.pumpAndSettle(const Duration(seconds: 5));

  //verify it appear in carousel
  expect(find.byType(HomePage), findsOneWidget);
  expect(find.byType(CarouselSlider), findsOneWidget);
  expect(find.byKey(const Key("Carousel_$bookName1")),findsOneWidget);

  await tester.dragUntilVisible(find.byKey(const Key("Home_$bookCategoryName2")),
      find.byType(NestedScrollView), const Offset(0, -300));
  await tester.pumpAndSettle(const Duration(seconds: 3));
  //Second Book
  // tap book and add to library
  var bookItem2 =find.text(bookName2);
  /*await tester.dragUntilVisible(bookItem2,
      find.byType(ListView).first, const Offset(-200, 0));
  await tester.pumpAndSettle(const Duration(seconds: 3));*/
  expect(bookItem2, findsWidgets);
  await tester.tap(bookItem2.first);
  await tester.pumpAndSettle(const Duration(seconds: 5));

  // verify book detail appear
  expect(find.byType(DetailBookPage), findsWidgets);
  expect(bookItem2, findsOneWidget);
  expect(find.text(bookAuthorName2), findsOneWidget);

  //tap back button
  await tester.tap(backButton);
  await tester.pumpAndSettle(const Duration(seconds: 5));

  await tester.dragUntilVisible(find.byKey(const Key("Carousel_$bookName2")),
      find.byType(NestedScrollView), const Offset(0, 300));

  await tester.pumpAndSettle(const Duration(seconds: 3));
  //verify it appear in carousel
  expect(find.byType(HomePage), findsOneWidget);
  expect(find.byType(CarouselSlider), findsOneWidget);
  expect(find.byKey(const Key("Carousel_$bookName2")),findsOneWidget);



}