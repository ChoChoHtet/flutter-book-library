
import 'package:json_annotation/json_annotation.dart';
part 'google_book_vo.g.dart';
@JsonSerializable()
class GoogleBookVO{
  @JsonKey(name:"volumeInfo")
  VolumeInfoVO? volumeInfo;


  GoogleBookVO(this.volumeInfo);

  factory GoogleBookVO.fromJson(Map<String, dynamic> json) => _$GoogleBookVOFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleBookVOToJson(this);
}

@JsonSerializable()
class VolumeInfoVO{
  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "authors")
  List<String>? authors;

  @JsonKey(name:"publisher")
  String? publisher;

  @JsonKey(name: "publishedDate")
  String? publishedDate;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name:"categories")
  List<String>? categories;

  @JsonKey(name: "imageLinks")
  ImageLinkVO? imageLinks;

  @JsonKey(name:"averageRating")
  double? averageRating;


  VolumeInfoVO(this.title, this.authors, this.publisher, this.publishedDate,
      this.description, this.categories, this.imageLinks, this.averageRating);

  factory VolumeInfoVO.fromJson(Map<String, dynamic> json) => _$VolumeInfoVOFromJson(json);

  Map<String, dynamic> toJson() => _$VolumeInfoVOToJson(this);
}

@JsonSerializable()
class ImageLinkVO{
  @JsonKey(name:"thumbnail")
  String? thumbnail;


  ImageLinkVO(this.thumbnail);

  factory ImageLinkVO.fromJson(Map<String, dynamic> json) => _$ImageLinkVOFromJson(json);

  Map<String, dynamic> toJson() => _$ImageLinkVOToJson(this);
}