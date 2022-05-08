import 'package:book_library/data/model/book_model.dart';
import 'package:book_library/data/model/impl/book_model_impl.dart';
import 'package:book_library/data/vos/overview_vo.dart';
import 'package:flutter/foundation.dart';

class HomeBloc extends ChangeNotifier {
  final BookModel _bookModel = BookModelImpl();

  List<OverviewVO> get overviewList => _overviewList;

  List<OverviewVO> _overviewList = [];

  HomeBloc() {
    _bookModel.getBooksOverview().then((value) {
      _overviewList = value;
      notifyListeners();
    });
  }
}
