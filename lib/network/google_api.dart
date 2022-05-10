
import 'package:book_library/network/api_constants.dart';
import 'package:book_library/network/responses/book_google_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'google_api.g.dart';
@RestApi(baseUrl: kGoogleUrl)
abstract class GoogleAPI{

  factory GoogleAPI(Dio dio) = _GoogleAPI;

  @GET(kEngPointSearch)
  Future<BookGoogleResponse> getSearchSuggestion(
      @Query(kApiKey)String apiKey,
      @Query(paramQuery)String query
      );
}