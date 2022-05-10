
import 'package:book_library/data/vos/google_book_vo.dart';
import 'package:json_annotation/json_annotation.dart';
part 'book_google_response.g.dart';
@JsonSerializable()
class BookGoogleResponse{
  @JsonKey(name:"items")
  List<GoogleBookVO>? bookList;

  BookGoogleResponse(this.bookList);

  factory  BookGoogleResponse.fromJson(Map<String, dynamic> json) => _$BookGoogleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BookGoogleResponseToJson(this);
}