import 'package:book_library/data/vos/book_vo.dart';
import 'package:book_library/persistence/dao/book_dao.dart';
import 'package:book_library/persistence/hive_constant.dart';
import 'package:hive/hive.dart';

class BookDaoImpl extends BookDao {

  BookDaoImpl.internal();

  static final BookDaoImpl _singleton = BookDaoImpl.internal();

  factory BookDaoImpl(){
    return _singleton;
  }

  @override
  void saveBookList(List<BookVO> bookList) async {
    Map<String, BookVO> bookMap = {
      for (var book in bookList) book.title ?? "": book
    };
    await getBookBox().putAll(bookMap);
  }

  @override
  void saveBookDetail(BookVO book) async {
    await getBookBox().put(book.title, book);
  }

  Box<BookVO> getBookBox() {
    return Hive.box<BookVO>(kBoxNameBookVO);
  }

  @override
  List<BookVO> getAllBooks() {
    return getBookBox().values.toList();
  }

  @override
  Stream<void> getBookEventStream() {
    return getBookBox().watch();
  }

  @override
  Stream<List<BookVO>> getBooksStream() {
    return Stream.value(getAllBooks());
  }

  @override
  BookVO? getBookByID(String title) {
    return getBookBox().get(title);
  }

  @override
  Stream<BookVO?> getBookByIDStream(String title) {
   return Stream.value(getBookByID(title));
  }

}
