import 'package:book_library/data/model/impl/book_google_model.dart';
import 'package:book_library/data/vos/book_vo.dart';
import 'package:book_library/network/dataAgent/google_data_agent.dart';
import 'package:book_library/network/dataAgent/impl/google_data_agent_impl.dart';

import '../../../persistence/dao/book_dao.dart';
import '../../../persistence/dao/impl/book_dao_impl.dart';

class BookGoogleModelImpl extends BookGoogleModel{
  final GoogleDataAgent _dataAgent = GoogleDataAgentImpl();
  final BookDao _bookDao = BookDaoImpl();
  @override
  Future<List<BookVO>> getSearchSuggestions(String query) async {
   return _dataAgent.getSearchSuggestions(query).then((value){
     if(value.isNotEmpty){
       _bookDao.saveBookList(value);
     }
     return Future.value(value);
   });
  }

}