import 'package:book_library/data/vos/book_vo.dart';
import 'package:book_library/data/vos/shelf_vo.dart';

import '../vos/overview_vo.dart';

abstract class BookModel {
  Future<List<OverviewVO>> getBooksOverview();
  Future<List<BookVO>> getBooksSeeMore(String listName,String bestSellerDate,int offset);
  Future<BookVO?> getBookByTitleDB(String title);
  Future<ShelfVO?> getShelfByID(String id);

  void saveBookVisited(BookVO bookVO);
  void saveShelf(ShelfVO shelfVO);
  void updateShelf(int index,ShelfVO shelfVO);
  void deleteShelf(String id);

  Stream<List<BookVO>> getVisitedBookFromDB();
  Stream<List<ShelfVO>> getShelvesFromDB();
}