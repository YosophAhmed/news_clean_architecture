import 'package:news_clean_architecture/core/resources/data_state.dart';
import 'package:news_clean_architecture/core/use_case/use_case.dart';
import 'package:news_clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:news_clean_architecture/features/daily_news/domain/repository/article_repository.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  const GetArticleUseCase(this.articleRepository);

  final ArticleRepository articleRepository;

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) =>
      articleRepository.getNewsArticles();
}
