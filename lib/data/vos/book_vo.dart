import 'package:book_library/persistence/hive_constant.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';
part 'book_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveBookID, adapterName: "BookVOAdapter")
class BookVO {
  @JsonKey(name: "title")
  @HiveField(0)
  String? title;

  @JsonKey(name: "author")
  @HiveField(1)
  String? author;

  @JsonKey(name: "description")
  @HiveField(2)
  String? description;

  @JsonKey(name: "publisher")
  @HiveField(3)
  String? publisher;

  @JsonKey(name: "contributor")
  @HiveField(4)
  String? contributor;

  @JsonKey(name: "book_image")
  @HiveField(5)
  String? bookImage;

  @JsonKey(name: "book_image_width")
  @HiveField(6)
  int? bookWidth;

  @JsonKey(name: "book_image_height")
  @HiveField(7)
  int? bookHeight;

  @JsonKey(name: "created_date")
  @HiveField(8)
  String? createdDate;

  @JsonKey(name: "updated_date")
  @HiveField(9)
  String? updatedDate;

  @JsonKey(name: "rank")
  @HiveField(10)
  int? rank;

  @HiveField(11)
  String? categories;

  @HiveField(12)
  int? visitedDateTime;

  BookVO({
    this.title,
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
    this.categories,
    this.visitedDateTime,
  });

  @override
  String toString() {
    return 'BookVO{title: $title, author: $author, description: $description, publisher: $publisher, contributor: $contributor, bookImage: $bookImage, bookWidth: $bookWidth, bookHeight: $bookHeight, createdDate: $createdDate, updatedDate: $updatedDate, rank: $rank, categories: $categories, visitedDateTime: $visitedDateTime}';
  }

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
          categories == other.categories &&
          visitedDateTime == other.visitedDateTime;

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
      categories.hashCode ^
      visitedDateTime.hashCode;

  factory BookVO.fromJson(Map<String, dynamic> json) => _$BookVOFromJson(json);

  Map<String, dynamic> toJson() => _$BookVOToJson(this);
}
