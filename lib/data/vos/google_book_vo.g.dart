// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_book_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoogleBookVO _$GoogleBookVOFromJson(Map<String, dynamic> json) => GoogleBookVO(
      json['volumeInfo'] == null
          ? null
          : VolumeInfoVO.fromJson(json['volumeInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GoogleBookVOToJson(GoogleBookVO instance) =>
    <String, dynamic>{
      'volumeInfo': instance.volumeInfo,
    };

VolumeInfoVO _$VolumeInfoVOFromJson(Map<String, dynamic> json) => VolumeInfoVO(
      json['title'] as String?,
      (json['authors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['publisher'] as String?,
      json['publishedDate'] as String?,
      json['description'] as String?,
      (json['categories'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['imageLinks'] == null
          ? null
          : ImageLinkVO.fromJson(json['imageLinks'] as Map<String, dynamic>),
      (json['averageRating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$VolumeInfoVOToJson(VolumeInfoVO instance) =>
    <String, dynamic>{
      'title': instance.title,
      'authors': instance.authors,
      'publisher': instance.publisher,
      'publishedDate': instance.publishedDate,
      'description': instance.description,
      'categories': instance.categories,
      'imageLinks': instance.imageLinks,
      'averageRating': instance.averageRating,
    };

ImageLinkVO _$ImageLinkVOFromJson(Map<String, dynamic> json) => ImageLinkVO(
      json['thumbnail'] as String?,
    );

Map<String, dynamic> _$ImageLinkVOToJson(ImageLinkVO instance) =>
    <String, dynamic>{
      'thumbnail': instance.thumbnail,
    };
