
import 'package:book_library/network/api_constants.dart';
import 'package:book_library/network/responses/book_response.dart';
import 'package:book_library/network/responses/book_see_more_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'book_api.g.dart';
@RestApi(baseUrl: kBookUrl)
abstract class BookAPI {
  factory BookAPI(Dio dio) = _BookAPI;

  @GET(kEndPointOverview)
  Future<BookResponse> getBookOverview(@Query(paramAPIKey) String apiKey);

  
  @GET("$kEndPointSeeMore/{date}/{list}.json")
  Future<BookSeeMoreResponse> getBookSeeMore(
      @Query(paramAPIKey)String apiKey,
      @Path(paramDate) String date,
      @Path(paramList)String listName,
      @Query(paramOffset) int offset
      );


}