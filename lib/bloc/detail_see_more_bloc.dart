import 'package:book_library/data/vos/book_vo.dart';
import 'package:flutter/foundation.dart';

import '../data/model/book_model.dart';
import '../data/model/impl/book_model_impl.dart';
import '../data/vos/overview_vo.dart';

class DetailSeeMoreBloc extends ChangeNotifier {
  final BookModel _bookModel = BookModelImpl();

  List<BookVO> get bookList => _bookList;

  List<BookVO> _bookList = [];
  DetailSeeMoreBloc(String listName, String bestSellerDate, int offset) {
    _bookModel.getBooksSeeMore(listName, bestSellerDate, offset).then((value) {
     _bookList = value;
      notifyListeners();
    });
  }
}