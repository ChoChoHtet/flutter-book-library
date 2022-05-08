// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookVO _$BookVOFromJson(Map<String, dynamic> json) => BookVO(
      title: json['title'] as String?,
      author: json['author'] as String?,
      description: json['description'] as String?,
      publisher: json['publisher'] as String?,
      contributor: json['contributor'] as String?,
      bookImage: json['book_image'] as String?,
      bookWidth: json['book_image_width'] as int?,
      bookHeight: json['book_image_height'] as int?,
      createdDate: json['created_date'] as String?,
      updatedDate: json['updated_date'] as String?,
      rank: json['rank'] as int?,
    );

Map<String, dynamic> _$BookVOToJson(BookVO instance) => <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'description': instance.description,
      'publisher': instance.publisher,
      'contributor': instance.contributor,
      'book_image': instance.bookImage,
      'book_image_width': instance.bookWidth,
      'book_image_height': instance.bookHeight,
      'created_date': instance.createdDate,
      'updated_date': instance.updatedDate,
      'rank': instance.rank,
    };
