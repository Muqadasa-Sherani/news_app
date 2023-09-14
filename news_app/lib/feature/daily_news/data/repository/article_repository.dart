import 'dart:io';

import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/feature/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app/feature/daily_news/data/models/article.dart';
import 'package:news_app/feature/daily_news/domain/entities/article.dart';
import 'package:news_app/feature/daily_news/domain/repository/article_repository.dart';
import '../data_sources/remote/news_api_service.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticle() async {
    try {
      final HttpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (HttpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(HttpResponse.data);
      } else {
        return DataFailed(DioError(
            error: HttpResponse.response.statusMessage,
            response: HttpResponse.response,
            type: DioErrorType.response,
            requestOptions: HttpResponse.response.requestOptions));
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
