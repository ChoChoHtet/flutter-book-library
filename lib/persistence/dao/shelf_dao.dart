import '../../data/vos/shelf_vo.dart';

abstract class ShelfDao{
  void saveShelf(ShelfVO shelfVO);
  void updateShelf(int index,ShelfVO shelfVO);
  void deleteShelf(String id);

  List<ShelfVO> getAllShelf();
  ShelfVO? getShelfByID(String id);

  Stream<void> getShelfWatchStream();
  Stream<ShelfVO?> getShelfByIDStream(String id);
  Stream<List<ShelfVO>> getShelfStreamFromDB();
}