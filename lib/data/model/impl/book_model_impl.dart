import 'package:book_library/data/model/book_model.dart';
import 'package:book_library/data/vos/book_vo.dart';
import 'package:book_library/data/vos/overview_vo.dart';
import 'package:book_library/network/dataAgent/impl/book_data_agent_impl.dart';

import '../../../network/dataAgent/book_data_agent.dart';

class BookModelImpl extends BookModel {
  final BookDataAgent _bookDataAgent = BookDataAgentImpl();

  @override
  Future<List<OverviewVO>> getBooksOverview() {
    return _bookDataAgent.getBooksOverview();
  }

  @override
  Future<List<BookVO>> getBooksSeeMore(
      String listName, String bestSellerDate, int offset) {
    return _bookDataAgent.getBooksSeeMore(listName, bestSellerDate, offset);
  }
}
