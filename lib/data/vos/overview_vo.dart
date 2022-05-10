import 'package:book_library/data/vos/book_vo.dart';
import 'package:json_annotation/json_annotation.dart';
part 'overview_vo.g.dart';

@JsonSerializable()
class OverviewVO {
  @JsonKey(name: "list_id")
  int? id;

  @JsonKey(name: "list_name")
  String? name;

  @JsonKey(name: "display_name")
  String? displayName;

  @JsonKey(name: "bestsellers_date")
  String? bestSellerDate;

  @JsonKey(name: "updated")
  String? updated;

  @JsonKey(name: "books")
  List<BookVO>? books;

  OverviewVO({
    this.id,
    this.name,
    this.displayName,
    this.bestSellerDate,
    this.updated,
    this.books,
  });


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OverviewVO &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          displayName == other.displayName &&
          bestSellerDate == other.bestSellerDate &&
          updated == other.updated &&
          books == other.books;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      displayName.hashCode ^
      bestSellerDate.hashCode ^
      updated.hashCode ^
      books.hashCode;

  factory OverviewVO.fromJson(Map<String, dynamic> json) =>
      _$OverviewVOFromJson(json);

  Map<String, dynamic> toJson() => _$OverviewVOToJson(this);
}
