import 'package:book_library/data/vos/book_vo.dart';

import '../vos/overview_vo.dart';

abstract class BookModel {
  Future<List<OverviewVO>> getBooksOverview();
  Future<List<BookVO>> getBooksSeeMore(String listName,String bestSellerDate,int offset);
}