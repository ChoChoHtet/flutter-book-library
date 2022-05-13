import 'package:book_library/data/vos/book_vo.dart';
import 'package:flutter/foundation.dart';

import '../data/model/book_model.dart';
import '../data/model/impl/book_model_impl.dart';

class DetailSeeMoreBloc extends ChangeNotifier {
  final BookModel _bookModel = BookModelImpl();

  List<BookVO> get bookList => _bookList;
  List<BookVO> _bookList = [];
  bool isDisposed = false;

  DetailSeeMoreBloc(String listName, String bestSellerDate, int offset) {
    _bookModel.getBooksSeeMore(listName, bestSellerDate, offset)
        .then((value) {
     _bookList = value;
      safeNotifyListener();
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
