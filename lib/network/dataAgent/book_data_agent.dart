import 'package:book_library/data/vos/overview_vo.dart';

abstract class BookDataAgent{
  Future<List<OverviewVO>> getBooksOverview();
}