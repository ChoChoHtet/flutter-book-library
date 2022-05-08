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

  @JsonKey(name: "updated")
  String? updated;

  @JsonKey(name: "books")
  List<BookVO>? books;

  OverviewVO({
    this.id,
    this.name,
    this.displayName,
    this.updated,
    this.books,
  });


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OverviewVO && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  factory OverviewVO.fromJson(Map<String, dynamic> json) =>
      _$OverviewVOFromJson(json);

  Map<String, dynamic> toJson() => _$OverviewVOToJson(this);
}
