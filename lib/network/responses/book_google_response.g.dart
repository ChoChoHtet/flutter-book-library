// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_google_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookGoogleResponse _$BookGoogleResponseFromJson(Map<String, dynamic> json) =>
    BookGoogleResponse(
      (json['items'] as List<dynamic>?)
          ?.map((e) => GoogleBookVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookGoogleResponseToJson(BookGoogleResponse instance) =>
    <String, dynamic>{
      'items': instance.bookList,
    };
