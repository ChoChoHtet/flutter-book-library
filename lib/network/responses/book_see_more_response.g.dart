// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_see_more_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookSeeMoreResponse _$BookSeeMoreResponseFromJson(Map<String, dynamic> json) =>
    BookSeeMoreResponse(
      status: json['status'] as String?,
      numOfResult: json['num_results'] as int?,
      results: json['results'] == null
          ? null
          : OverviewVO.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookSeeMoreResponseToJson(
        BookSeeMoreResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'num_results': instance.numOfResult,
      'results': instance.results,
    };
