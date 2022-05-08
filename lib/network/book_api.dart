
import 'package:book_library/network/api_constants.dart';
import 'package:book_library/network/responses/book_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'book_api.g.dart';
@RestApi(baseUrl: kBookUrl)
abstract class BookAPI {
  factory BookAPI(Dio dio) = _BookAPI;

  @GET(kEndPointOverview)
  Future<BookResponse> getBookOverview(@Query(paramAPIKey) String apiKey);


}