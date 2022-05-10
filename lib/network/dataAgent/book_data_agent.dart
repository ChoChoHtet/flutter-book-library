import 'package:book_library/data/vos/book_vo.dart';
import 'package:book_library/data/vos/overview_vo.dart';

abstract class BookDataAgent{
  Future<List<OverviewVO>> getBooksOverview();
  Future<List<BookVO>> getBooksSeeMore(String listName,String bestSellerDate,int offset);
}