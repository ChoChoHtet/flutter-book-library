import 'package:book_library/data/vos/overview_vo.dart';
import 'package:json_annotation/json_annotation.dart';
part 'book_see_more_response.g.dart';
@JsonSerializable()
class BookSeeMoreResponse {
  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "num_results")
  int? numOfResult;

  @JsonKey(name: "results")
  OverviewVO? results;

  BookSeeMoreResponse({
    this.status,
    this.numOfResult,
    this.results,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookSeeMoreResponse &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          numOfResult == other.numOfResult &&
          results == other.results;

  @override
  int get hashCode => status.hashCode ^ numOfResult.hashCode ^ results.hashCode;

  factory BookSeeMoreResponse.fromJson(Map<String, dynamic> json) =>
      _$BookSeeMoreResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BookSeeMoreResponseToJson(this);
}
