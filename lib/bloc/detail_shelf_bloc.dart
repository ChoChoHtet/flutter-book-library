import 'package:flutter/foundation.dart';

import '../data/model/book_model.dart';
import '../data/model/impl/book_model_impl.dart';
import '../data/vos/book_vo.dart';
import '../data/vos/shelf_vo.dart';
import '../utils/action_enum.dart';

class DetailShelfBloc extends ChangeNotifier{
  final BookModel _bookModel = BookModelImpl();
  var isDisposed = false;

  ShelfVO? _shelfVO;

  ShelfVO? get shelfItem => _shelfVO;
  String? editedShelfName = "";
  ShelfAction actionShelf = ShelfAction.none;
  List<BookVO> _bookList  = [];

  List<BookVO> get bookList => _bookList;

  DetailShelfBloc(String id){
    _bookModel.getShelfByID(id).then((value) {
      _shelfVO = value;
      editedShelfName = value?.name ;
      _bookList = value?.books ?? [];
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
  void sortBy(int sortType) {
    switch (sortType) {
      case 1:
        _bookList.sort((a, b) =>
        a.visitedDateTime?.compareTo(b.visitedDateTime ?? -1) ?? 0);
       /* List<BookVO> temp = _bookList.reversed.toList();
        _bookList = temp;*/
        break;
      case 2:
        _bookList.sort((a, b) => a.title
            .toString()
            .toLowerCase()
            .compareTo(b.title.toString().toLowerCase()));
        /*List<BookVO> temp = _bookList.reversed.toList();
        _bookList = temp;*/
        break;
      case 3:
        _bookList.sort((a, b) => a.author
            .toString()
            .toLowerCase()
            .compareTo(b.author.toString().toLowerCase()));
       /* List<BookVO> temp = _bookList.reversed.toList();
        _bookList = temp;*/
        break;
    }
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