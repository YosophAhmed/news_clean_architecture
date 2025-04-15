import 'package:dio/dio.dart';
import 'package:news_clean_architecture/features/daily_news/data/models/article.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants/api_constants.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.newsApiBaseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query('apiKey') required String? apiKey,
    @Query('country') required String? country,
    @Query('category') required String? category,
  });
}
