import 'package:book_library/data/model/book_model.dart';
import 'package:book_library/data/vos/book_vo.dart';
import 'package:book_library/data/vos/overview_vo.dart';
import 'package:book_library/network/dataAgent/impl/book_data_agent_impl.dart';
import 'package:book_library/persistence/dao/book_dao.dart';
import 'package:book_library/persistence/dao/book_visited_dao.dart';
import 'package:book_library/persistence/dao/impl/book_dao_impl.dart';
import 'package:book_library/persistence/dao/impl/book_visited_dao_impl.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../network/dataAgent/book_data_agent.dart';

class BookModelImpl extends BookModel {
  final BookDataAgent _bookDataAgent = BookDataAgentImpl();
  final BookDao _bookDao = BookDaoImpl();

  final BookVisitedDao visitedDao = BookVisitedDaoImpl();

  @override
  Future<List<OverviewVO>> getBooksOverview() async {
    return _bookDataAgent.getBooksOverview().then((value) {
      if(value.isNotEmpty){
        for (var element in value) {
          _bookDao.saveBookList(element.books ?? []);
        }
      }
      return Future.value(value);
    });
  }

  @override
  Future<List<BookVO>> getBooksSeeMore(
      String listName, String bestSellerDate, int offset) {
    return _bookDataAgent.getBooksSeeMore(listName, bestSellerDate, offset);
  }

  @override
  Future<BookVO?> getBookByTitleDB(String title) {
    return Future.value(_bookDao.getBookByID(title));
  }

  /*@override
  Stream<List<BookVO>> getAllBooksVisited() {
    return visitedDao
        .getBookEventStream()
        .startWith(visitedDao.getVisitedBooksStream())
        .map((event) => visitedDao.getAllBooks());
  }*/

  @override
  void saveBookVisited(BookVO bookVO) async {
    visitedDao.saveBookDetail(bookVO);
  }

  @override
  Stream<List<BookVO>> getVisitedBookFromDB() {
    return visitedDao
        .getBookEventStream()
        .startWith(visitedDao.getVisitedBooksStream())
        .map((event) => visitedDao.getAllBooks());
  }
}
