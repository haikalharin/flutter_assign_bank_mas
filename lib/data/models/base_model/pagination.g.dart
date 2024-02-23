// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginationImpl _$$PaginationImplFromJson(Map<String, dynamic> json) =>
    _$PaginationImpl(
      totalElements: json['total_elements'] as int?,
      totalPages: json['total_pages'] as int?,
      last: json['last'] as bool?,
      size: json['size'] as int?,
      number: json['number'] as int?,
      first: json['first'] as bool?,
      sort: json['sort'] == null
          ? null
          : Sort.fromJson(json['sort'] as Map<String, dynamic>),
      numberOfElements: json['number_of_elements'] as int?,
      empty: json['empty'] as bool?,
    );

Map<String, dynamic> _$$PaginationImplToJson(_$PaginationImpl instance) =>
    <String, dynamic>{
      'total_elements': instance.totalElements,
      'total_pages': instance.totalPages,
      'last': instance.last,
      'size': instance.size,
      'number': instance.number,
      'first': instance.first,
      'sort': instance.sort?.toJson(),
      'number_of_elements': instance.numberOfElements,
      'empty': instance.empty,
    };

_$SortImpl _$$SortImplFromJson(Map<String, dynamic> json) => _$SortImpl(
      unsorted: json['unsorted'] as bool?,
      sorted: json['sorted'] as bool?,
      empty: json['empty'] as bool?,
    );

Map<String, dynamic> _$$SortImplToJson(_$SortImpl instance) =>
    <String, dynamic>{
      'unsorted': instance.unsorted,
      'sorted': instance.sorted,
      'empty': instance.empty,
    };
