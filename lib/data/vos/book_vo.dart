import 'package:json_annotation/json_annotation.dart';
part 'book_vo.g.dart';

@JsonSerializable()
class BookVO {
  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "author")
  String? author;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "publisher")
  String? publisher;

  @JsonKey(name: "contributor")
  String? contributor;

  @JsonKey(name: "book_image")
  String? bookImage;

  @JsonKey(name: "book_image_width")
  int? bookWidth;

  @JsonKey(name: "book_image_height")
  int? bookHeight;

  @JsonKey(name: "created_date")
  String? createdDate;

  @JsonKey(name: "updated_date")
  String? updatedDate;

  @JsonKey(name: "rank")
  int? rank;

  List<String>? categories;

  BookVO(
      {this.title,
      this.author,
      this.description,
      this.publisher,
      this.contributor,
      this.bookImage,
      this.bookWidth,
      this.bookHeight,
      this.createdDate,
      this.updatedDate,
      this.rank,
      this.categories});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookVO &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          author == other.author &&
          description == other.description &&
          publisher == other.publisher &&
          contributor == other.contributor &&
          bookImage == other.bookImage &&
          bookWidth == other.bookWidth &&
          bookHeight == other.bookHeight &&
          createdDate == other.createdDate &&
          updatedDate == other.updatedDate &&
          rank == other.rank &&
          categories == other.categories;

  @override
  int get hashCode =>
      title.hashCode ^
      author.hashCode ^
      description.hashCode ^
      publisher.hashCode ^
      contributor.hashCode ^
      bookImage.hashCode ^
      bookWidth.hashCode ^
      bookHeight.hashCode ^
      createdDate.hashCode ^
      updatedDate.hashCode ^
      rank.hashCode ^
      categories.hashCode;

  factory BookVO.fromJson(Map<String, dynamic> json) => _$BookVOFromJson(json);

  Map<String, dynamic> toJson() => _$BookVOToJson(this);
}
