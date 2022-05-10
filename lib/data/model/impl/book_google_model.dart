import 'package:book_library/data/vos/book_vo.dart';

abstract class BookGoogleModel{
  Future<List<BookVO>> getSearchSuggestions(String query);
}