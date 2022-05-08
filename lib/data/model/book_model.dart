import '../vos/overview_vo.dart';

abstract class BookModel {
  Future<List<OverviewVO>> getBooksOverview();
}