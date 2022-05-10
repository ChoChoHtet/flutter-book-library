// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _GoogleAPI implements GoogleAPI {
  _GoogleAPI(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://www.googleapis.com/books';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BookGoogleResponse> getSearchSuggestion(apiKey, query) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'jJIHXMLHCJAiyDwYrI1gnCjBtXf2Lafh': apiKey,
      r'q': query
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BookGoogleResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/v1/volumes',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BookGoogleResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
