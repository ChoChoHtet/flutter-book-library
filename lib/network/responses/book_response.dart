import 'package:book_library/data/vos/overview_vo.dart';
import 'package:json_annotation/json_annotation.dart';
part 'book_response.g.dart';
@JsonSerializable()
class BookResponse {
  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "num_results")
  int? numOfResult;

  @JsonKey(name: "results")
  BookListResponse? results;

  BookResponse({
    this.status,
    this.numOfResult,
    this.results,
  });

  factory BookResponse.fromJson(Map<String, dynamic> json) =>
      _$BookResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BookResponseToJson(this);
}

@JsonSerializable()
class BookListResponse {
  @JsonKey(name: "lists")
  List<OverviewVO>? bookList;


  BookListResponse(this.bookList);

  factory BookListResponse.fromJson(Map<String, dynamic> json) =>
      _$BookListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BookListResponseToJson(this);
}
