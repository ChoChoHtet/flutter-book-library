import 'package:book_library/data/model/book_model.dart';
import 'package:book_library/data/vos/book_vo.dart';
import 'package:book_library/data/vos/overview_vo.dart';
import 'package:book_library/data/vos/shelf_vo.dart';
import 'package:book_library/network/dataAgent/impl/book_data_agent_impl.dart';
import 'package:book_library/persistence/dao/book_dao.dart';
import 'package:book_library/persistence/dao/book_visited_dao.dart';
import 'package:book_library/persistence/dao/impl/book_dao_impl.dart';
import 'package:book_library/persistence/dao/impl/book_visited_dao_impl.dart';
import 'package:book_library/persistence/dao/impl/shelf_dao_impl.dart';
import 'package:book_library/persistence/dao/shelf_dao.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../network/dataAgent/book_data_agent.dart';

class BookModelImpl extends BookModel {
  final BookDataAgent _bookDataAgent = BookDataAgentImpl();

  final BookDao _bookDao = BookDaoImpl();
  final BookVisitedDao visitedDao = BookVisitedDaoImpl();
  final ShelfDao _shelfDao = ShelfDaoImpl();

  @override
  Future<List<OverviewVO>> getBooksOverview() {
    return _bookDataAgent.getBooksOverview().then((value) async {
      if (value.isNotEmpty) {
        for (var element in value) {
          Future<List<BookVO>> books = Future.value(element.books?.map((e) {
                //   debugPrint("categories: ${element.name}");
                e.categories = element.name ?? "General";
                return e;
              }).toList() ??
              []);
          _bookDao.saveBookList(await books);
        }
      }
      return Future.value(value);
    });
  }

  @override
  Future<List<BookVO>> getBooksSeeMore(
      String listName, String bestSellerDate, int offset) {
    return _bookDataAgent
        .getBooksSeeMore(listName, bestSellerDate, offset)
        .then((value) async {
      if (value.isNotEmpty) {
        Future<List<BookVO>> books = Future.value(value.map((e) {
          e.categories = listName;
          return e;
        }).toList());
        _bookDao.saveBookList(await books);
      }
      return Future.value(value);
    });
  }

  @override
  Future<BookVO?> getBookByTitleDB(String title) {
    return Future.value(_bookDao.getBookByID(title));
  }

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

  @override
  Future<ShelfVO?> getShelfByID(String id) {
    return Future.value(_shelfDao.getShelfByID(id));
  }

  @override
  Stream<List<ShelfVO>> getShelvesFromDB() {
    return _shelfDao
        .getShelfWatchStream()
        .startWith(_shelfDao.getShelfStreamFromDB())
        .map((event) => _shelfDao.getAllShelf());
  }

  @override
  void saveShelf(ShelfVO shelfVO) {
    return _shelfDao.saveShelf(shelfVO);
  }

  @override
  void updateShelf(int index, ShelfVO shelfVO) {
   return _shelfDao.updateShelf(index, shelfVO);
  }

  @override
  void deleteShelf(String id) async{
   _shelfDao.deleteShelf(id);
  }
}
