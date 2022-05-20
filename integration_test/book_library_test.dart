import 'package:book_library/data/vos/book_vo.dart';
import 'package:book_library/data/vos/shelf_vo.dart';
import 'package:book_library/main.dart';
import 'package:book_library/persistence/hive_constant.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'add_book_to_library_test.dart';
import 'your_book_test.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BookVOAdapter());
  Hive.registerAdapter(ShelfVOAdapter());

  await Hive.openBox<BookVO>(kBoxNameBookVO);
  await Hive.openBox<BookVO>(kBoxNameBookVisited);
  await Hive.openBox<ShelfVO>(kBoxNameShelf);

  testWidgets("Book Library Test", (tester) async {

    await tester.pumpWidget(const MyApp());
    await Future.delayed(const Duration(seconds: 2));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    await testAddBookToLibrary(tester);

    await testYourBook(tester);
  });
}
