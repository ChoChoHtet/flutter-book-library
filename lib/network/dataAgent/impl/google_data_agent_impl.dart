import 'package:book_library/data/vos/book_vo.dart';
import 'package:book_library/mapper/book_mapper.dart';
import 'package:book_library/network/api_constants.dart';
import 'package:book_library/network/dataAgent/google_data_agent.dart';
import 'package:book_library/network/google_api.dart';
import 'package:dio/dio.dart';

class GoogleDataAgentImpl extends GoogleDataAgent{
  late GoogleAPI _googleAPI;
  GoogleDataAgentImpl.internal(){
    Dio dio = Dio();
    _googleAPI = GoogleAPI(dio);
  }

  static final GoogleDataAgentImpl _singleton = GoogleDataAgentImpl.internal();

  factory GoogleDataAgentImpl(){
    return _singleton;
  }
  final _bookMapper = BookMapper();

  @override
  Future<List<BookVO>> getSearchSuggestions(String query) {
   return _googleAPI.getSearchSuggestion(kApiKey, query)
       .asStream()
       .map((event) => _bookMapper.mapList(event.bookList ?? []))
       .first;
  }

}