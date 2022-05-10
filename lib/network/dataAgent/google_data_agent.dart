import 'package:book_library/data/vos/book_vo.dart';

abstract class GoogleDataAgent{
  Future<List<BookVO>> getSearchSuggestions(String query);
}