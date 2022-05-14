import 'package:book_library/data/vos/book_vo.dart';
import 'package:flutter/foundation.dart';

import '../data/model/book_model.dart';
import '../data/model/impl/book_model_impl.dart';
import '../data/vos/shelf_vo.dart';

class AddShelfBloc extends ChangeNotifier {
  final BookModel _bookModel = BookModelImpl();
  List<ShelfVO> _shelfList = [];

  List<ShelfVO> get shelfList => _shelfList;
  var isDisposed = false;
  List<BookVO> bookTemp  = [];

  AddShelfBloc() {
    _bookModel.getShelvesFromDB().listen((event) {
      _shelfList = event;
      debugPrint("event list: ${event.length}");
      safeNotifyListener();
    });
  }

  void addBookToShelves(String title,int index){
    var shelf = shelfList[index] ;
    bookTemp = shelf.books != null ? shelf.books! : [] ;
    _bookModel.getBookByTitleDB(title).then((book) {
      if(book != null){
        bookTemp.add(book);
        shelf.books = bookTemp;
        shelf.bookNo = bookTemp.length;
       // debugPrint("shelf temp: ${bookTemp.length},title: $title, ${book.toString()}");
        _bookModel.saveShelf(shelf);
       // debugPrint("shelf book: ${shelf.books?.length}");
      }
    });

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
