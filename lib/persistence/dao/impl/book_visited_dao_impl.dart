import 'package:book_library/data/vos/book_vo.dart';
import 'package:book_library/persistence/dao/book_visited_dao.dart';
import 'package:hive/hive.dart';

import '../../hive_constant.dart';

class BookVisitedDaoImpl implements BookVisitedDao{

  BookVisitedDaoImpl.internal();

  static final BookVisitedDaoImpl _singleton = BookVisitedDaoImpl.internal();

  factory BookVisitedDaoImpl(){
    return _singleton;
  }



  @override
  BookVO? getBookByID(String title) {
   return getBookBox().get(title);
  }

  @override
  List<BookVO> getAllBooks() {
    return getBookBox().values.toList();
  }


  @override
  Stream<BookVO?> getBookByIDStream(String title) {
    return Stream.value(getBookByID(title));
  }

  @override
  Stream<void> getBookEventStream() {
   return getBookBox().watch();
  }

  @override
  void saveBookDetail(BookVO book) async {
   await getBookBox().put(book.title, book);
  }
  Box<BookVO> getBookBox() {
    return Hive.box<BookVO>(kBoxNameBookVisited);
  }

  @override
  Stream<List<BookVO>> getVisitedBooksStream() {
    return Stream.value(getAllBooks());
  }



}