import 'package:book_library/data/model/impl/book_google_model.dart';
import 'package:book_library/data/vos/book_vo.dart';
import 'package:book_library/network/dataAgent/google_data_agent.dart';
import 'package:book_library/network/dataAgent/impl/google_data_agent_impl.dart';

class BookGoogleModelImpl extends BookGoogleModel{
  final GoogleDataAgent _dataAgent = GoogleDataAgentImpl();
  @override
  Future<List<BookVO>> getSearchSuggestions(String query) {
   return _dataAgent.getSearchSuggestions(query);
  }

}