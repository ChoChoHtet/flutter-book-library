import '../../data/vos/book_vo.dart';

abstract class BookDao{
 void saveBookList(List<BookVO> bookList);

 void saveBookDetail(BookVO book);

 List<BookVO> getAllBooks();

 BookVO? getBookByID(String title);

 Stream<void> getBookEventStream();

 Stream<List<BookVO>> getBooksStream();

 Stream<BookVO?> getBookByIDStream(String title);
}