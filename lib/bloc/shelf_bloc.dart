import 'package:book_library/data/model/book_model.dart';
import 'package:book_library/data/model/impl/book_model_impl.dart';
import 'package:flutter/foundation.dart';

import '../data/vos/shelf_vo.dart';
import 'package:uuid/uuid.dart';


class ShelfBloc extends ChangeNotifier{
  final BookModel _bookModel = BookModelImpl();
  List<ShelfVO> _shelfList =[];

  List<ShelfVO> get shelfList => _shelfList;
  var isDisposed = false;

  ShelfBloc(){
    _bookModel.getShelvesFromDB().listen((event) {
      _shelfList = event;
      safeNotifyListener();
    }).onError((error){
      debugPrint("Shelf DB error $error ");
    });
  }
  void createNewShelf(String shelfName){
    var uuid = const Uuid();
    ShelfVO shelfVO = ShelfVO(id: uuid.v4(),name: shelfName,bookNo: 0);
    _bookModel.saveShelf(shelfVO);
  }
  void safeNotifyListener() {
    if (!isDisposed) {
      notifyListeners();
    }
  }

  void clearDisposeNotify() {
    if (!isDisposed) {
      isDisposed = true;
    }
  }
}