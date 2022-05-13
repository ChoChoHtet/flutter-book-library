import 'package:book_library/data/model/book_model.dart';
import 'package:book_library/data/model/impl/book_model_impl.dart';
import 'package:book_library/data/vos/category_chip_vo.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

import '../data/vos/book_vo.dart';

class LibraryBloc extends ChangeNotifier {
  final BookModel _bookModel = BookModelImpl();

  List<BookVO> _bookList = [];
  List<CategoryChipVO> _categoriesList = [];

  bool isDisposed = false;
  List<BookVO> get visitedBookList => _bookList;
  List<CategoryChipVO> get categoryList => _categoriesList;
  bool isRefresh = false;

  LibraryBloc() {
    _bookModel.getVisitedBookFromDB().listen((event) {
      _bookList = event;
      categoriesName(event);
      safeNotifyListener();
    }).onError((error) {
      debugPrint("Library Visited Book Error:$error");
    });
  }
  void categoriesName(List<BookVO> bookList) {
    List<CategoryChipVO> categories = [];
    for (var element in bookList) {
      // debugPrint("CategoriesName: ${element.categories}");
      if (element.categories != null && element.categories!.isNotEmpty) {
        categories
            .add(CategoryChipVO(name: element.categories, isSelected: false));
      }
    }
    _categoriesList = categories.toSet().toList();
    debugPrint("CategoriesList:${_categoriesList.toString()}");
  }

  void onTapCategory(int curIndex) {
    List<CategoryChipVO> categories =
        _categoriesList.mapIndexed((index, element) {
      if (curIndex == index) {
        // debugPrint("State change-> pre ${ element.isSelected}}");
        element.isSelected = !(element.isSelected ?? false);
        //  debugPrint("State change-> post ${ element.isSelected}}");
      }
      return element;
    }).toList();

    categories.sort((a, b) => b.isSelected == true ? 1 : -1);
    _categoriesList = categories;

    if (isRefresh == true) {
      isRefresh = false;
    } else {
      isRefresh = true;
    }
    safeNotifyListener();
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
