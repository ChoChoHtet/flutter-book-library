// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overview_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverviewVO _$OverviewVOFromJson(Map<String, dynamic> json) => OverviewVO(
      id: json['list_id'] as int?,
      name: json['list_name'] as String?,
      displayName: json['display_name'] as String?,
      updated: json['updated'] as String?,
      books: (json['books'] as List<dynamic>?)
          ?.map((e) => BookVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OverviewVOToJson(OverviewVO instance) =>
    <String, dynamic>{
      'list_id': instance.id,
      'list_name': instance.name,
      'display_name': instance.displayName,
      'updated': instance.updated,
      'books': instance.books,
    };
