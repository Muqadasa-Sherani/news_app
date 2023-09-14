import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/feature/daily_news/data/models/article.dart';
import 'package:news_app/feature/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticle() {
    // TODO: implement getNewsArticle
    throw UnimplementedError();
  }
}
