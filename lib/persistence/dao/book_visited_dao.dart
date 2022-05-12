import '../../data/vos/book_vo.dart';

abstract class BookVisitedDao {
  void saveBookDetail(BookVO book);

  BookVO? getBookByID(String title);
  List<BookVO> getAllBooks();

  Stream<void> getBookEventStream();

  Stream<BookVO?> getBookByIDStream(String title);

  Stream<List<BookVO>> getVisitedBooksStream();
}
