// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'https://jira.atlassian.com/rest/api/latest/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getResults(jql, startAt, maxResults) async {
    ArgumentError.checkNotNull(jql, 'jql');
    ArgumentError.checkNotNull(startAt, 'startAt');
    ArgumentError.checkNotNull(maxResults, 'maxResults');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      'jql': jql,
      'startAt': startAt,
      'maxResults': maxResults
    };
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request('/search',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = SearchResult.fromJson(_result.data);
    return Future.value(value);
  }
}
