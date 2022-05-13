import 'package:book_library/data/model/book_model.dart';
import 'package:book_library/data/model/impl/book_model_impl.dart';
import 'package:book_library/data/vos/book_vo.dart';
import 'package:flutter/foundation.dart';

class DetailBookBloc extends ChangeNotifier {
  final BookModel _bookModel = BookModelImpl();

  BookVO? get bookItem => _bookVO;
  List<BookVO> get bookList => _bookList;

  BookVO? _bookVO;
  List<BookVO> _bookList = [];
  bool isDisposed = false;

  DetailBookBloc(String title) {
    _bookModel.getBookByTitleDB(title).then((value) {
      _bookVO = value;
      debugPrint("Category name: ${_bookVO?.categories}");
      if (value != null) {
        var visited = value;
        visited.visitedDateTime = DateTime.now().millisecondsSinceEpoch;
        _bookModel.saveBookVisited(visited);

        if ( value.categories != null) {
          _bookModel.getBooksSeeMore(value.categories ?? "", "current", 0)
              .then((value) {
            _bookList = value;
          }).onError((error, stackTrace) {
            _bookList = [];
          });
        }
      }
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
