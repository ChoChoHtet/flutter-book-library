import 'package:book_library/data/vos/shelf_vo.dart';
import 'package:book_library/persistence/dao/shelf_dao.dart';
import 'package:book_library/persistence/hive_constant.dart';
import 'package:hive/hive.dart';

class ShelfDaoImpl extends ShelfDao {
  @override
  List<ShelfVO> getAllShelf() {
   return getShelfBox().values.toList();
  }

  @override
  ShelfVO? getShelfByID(String id) {
   return getShelfBox().get(id);
  }

  @override
  Stream<ShelfVO?> getShelfByIDStream(String id) {
   return Stream.value(getShelfByID(id));
  }

  @override
  Stream<List<ShelfVO>> getShelfStreamFromDB() {
    return Stream.value(getAllShelf());
  }

  @override
  Stream<void> getShelfWatchStream() {
    return getShelfBox().watch();
  }

  @override
  void saveShelf(ShelfVO shelfVO) async {
    await getShelfBox().put(shelfVO.id, shelfVO);
  }

  Box<ShelfVO> getShelfBox() {
    return Hive.box<ShelfVO>(kBoxNameShelf);
  }
}
