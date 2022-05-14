import 'package:flutter/foundation.dart';

import '../data/model/book_model.dart';
import '../data/model/impl/book_model_impl.dart';
import '../data/vos/shelf_vo.dart';
import '../utils/action_enum.dart';

class DetailShelfBloc extends ChangeNotifier{
  final BookModel _bookModel = BookModelImpl();
  var isDisposed = false;

  ShelfVO? _shelfVO;

  ShelfVO? get shelfItem => _shelfVO;
  String? editedShelfName = "";
  ShelfAction actionShelf = ShelfAction.none;

  DetailShelfBloc(String id){
    _bookModel.getShelfByID(id).then((value) {
      _shelfVO = value;
      editedShelfName = value?.name ;
      safeNotifyListener();
    });
  }

  void updateShelfName(String shelfName,int index){
    if(shelfItem != null){
      ShelfVO shelf = shelfItem!;
      shelf.name = shelfName;
      _bookModel.updateShelf(index,shelf);
      editedShelfName = shelfName;
     // safeNotifyListener();
    }
  }
  void deleteShelf(String id) {
    _bookModel.deleteShelf(id);
  }
  void onTapDoneEdit(String shelfName,int index){
    actionShelf = ShelfAction.done;
    editedShelfName = shelfName;
    updateShelfName(shelfName,index);
    safeNotifyListener();
  }
  void onTapEditMenu(){
    actionShelf = ShelfAction.edit;
    safeNotifyListener();
  }
  void onTapDeleteMenu(){
    actionShelf = ShelfAction.delete;
    safeNotifyListener();
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