import 'package:dio/dio.dart';
import 'package:jira/jira/data/issue_dto.dart';
import 'package:retrofit/retrofit.dart';

import 'search_result_dto.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://jira.atlassian.com/rest/api/latest/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/search")
  Future<SearchResultDto> getResults(@Query("jql") String jql,
      @Query("startAt") int startAt, @Query("maxResults") int maxResults);

  @GET("/issue/{id}")
  Future<IssueDto> getById(@Path("id") String id);
}
