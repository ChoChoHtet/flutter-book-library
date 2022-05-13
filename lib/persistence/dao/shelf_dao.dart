import '../../data/vos/shelf_vo.dart';

abstract class ShelfDao{
  void saveShelf(ShelfVO shelfVO);

  List<ShelfVO> getAllShelf();
  ShelfVO? getShelfByID(String id);

  Stream<void> getShelfWatchStream();
  Stream<ShelfVO?> getShelfByIDStream(String id);
  Stream<List<ShelfVO>> getShelfStreamFromDB();
}