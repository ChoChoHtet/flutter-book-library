import 'package:book_library/data/model/book_model.dart';
import 'package:book_library/data/model/impl/book_model_impl.dart';
import 'package:book_library/data/vos/book_vo.dart';
import 'package:flutter/foundation.dart';

class DetailBookBloc extends ChangeNotifier {
  final BookModel _bookModel = BookModelImpl();
  BookVO? get bookItem => _bookVO;
  List<BookVO?> get bookList => _bookList;

  BookVO? _bookVO;
  List<BookVO> _bookList = [];

  DetailBookBloc(String title) {
    _bookModel.getBookByTitleDB(title).then((value) {
      _bookVO = value;
      if (value != null) {
        var visited  = value;
        visited.visitedDateTime = DateTime.now().millisecondsSinceEpoch;
        _bookModel.saveBookVisited(visited);
      }
      notifyListeners();
    });
  }
}
