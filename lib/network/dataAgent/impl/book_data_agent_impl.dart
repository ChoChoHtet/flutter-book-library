import 'package:book_library/data/vos/overview_vo.dart';
import 'package:book_library/network/api_constants.dart';
import 'package:book_library/network/book_api.dart';
import 'package:book_library/network/dataAgent/book_data_agent.dart';
import 'package:dio/dio.dart';

import '../../../data/vos/book_vo.dart';

class BookDataAgentImpl extends BookDataAgent {
  late BookAPI _bookAPI;

  BookDataAgentImpl.internal() {
    final dio = Dio();
    _bookAPI = BookAPI(dio);
  }

  static final BookDataAgentImpl _singleton = BookDataAgentImpl.internal();

  factory BookDataAgentImpl() {
    return _singleton;
  }

  @override
  Future<List<OverviewVO>> getBooksOverview() {
    return _bookAPI
        .getBookOverview(kApiKey)
        .asStream()
        .map((event) => event.results?.bookList ?? [])
        .first;
  }

  @override
  Future<List<BookVO>> getBooksSeeMore(
      String listName, String bestSellerDate, int offset) {
    return _bookAPI
        .getBookSeeMore(kApiKey, bestSellerDate, listName, offset)
        .asStream()
        .map((event) => event.results?.books ?? [])
        .first;
  }
}
