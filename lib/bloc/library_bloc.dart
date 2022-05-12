import 'package:book_library/data/model/book_model.dart';
import 'package:book_library/data/model/impl/book_model_impl.dart';
import 'package:flutter/foundation.dart';

import '../data/vos/book_vo.dart';

class LibraryBloc extends ChangeNotifier {
  final BookModel _bookModel = BookModelImpl();
  List<BookVO> get visitedBookList => _bookList;
  List<BookVO> _bookList = [];

  bool isDisposed = false;

  LibraryBloc() {
    _bookModel.getVisitedBookFromDB().listen((event) {
      _bookList = event;
      safeNotifyListener();
    }).onError((error) {
      debugPrint("Library Visited Book Error:$error");
    });
  }
  void sortBy(int sortType) {
    switch (sortType) {
      case 1:
        _bookList.sort((a, b) =>
            a.visitedDateTime?.compareTo(b.visitedDateTime ?? -1) ?? 0);
        List<BookVO> temp = _bookList.reversed.toList();
        _bookList = temp;
        break;
      case 2:
       _bookList.sort((a, b) => a.title
            .toString()
            .toLowerCase()
            .compareTo(b.title.toString().toLowerCase()));
        List<BookVO> temp = _bookList.reversed.toList();
        _bookList = temp;
        break;
      case 3:
        _bookList.sort((a, b) => a.author
            .toString()
            .toLowerCase()
            .compareTo(b.author.toString().toLowerCase()));
        List<BookVO> temp = _bookList.reversed.toList();
        _bookList = temp;
        break;
      default:
        _bookList.sort((a, b) =>
            a.visitedDateTime?.compareTo(b.visitedDateTime ?? -1) ?? 0);
        List<BookVO> temp = _bookList.reversed.toList();
        _bookList = temp.reversed.toList();
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
