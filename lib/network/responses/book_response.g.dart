// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookResponse _$BookResponseFromJson(Map<String, dynamic> json) => BookResponse(
      status: json['status'] as String?,
      numOfResult: json['num_results'] as int?,
      results: json['results'] == null
          ? null
          : BookListResponse.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookResponseToJson(BookResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'num_results': instance.numOfResult,
      'results': instance.results,
    };

BookListResponse _$BookListResponseFromJson(Map<String, dynamic> json) =>
    BookListResponse(
      (json['lists'] as List<dynamic>?)
          ?.map((e) => OverviewVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookListResponseToJson(BookListResponse instance) =>
    <String, dynamic>{
      'lists': instance.bookList,
    };
