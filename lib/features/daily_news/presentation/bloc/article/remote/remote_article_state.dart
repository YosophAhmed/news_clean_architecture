import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news_clean_architecture/features/daily_news/domain/entities/article.dart';

abstract class RemoteArticleState extends Equatable {
  const RemoteArticleState({this.articles, this.exception});

  final List<ArticleEntity>? articles;
  final DioException? exception;

  @override
  List<Object?> get props => [articles!, exception!];
}

class RemoteArticlesLoading extends RemoteArticleState {}

class RemoteArticlesDone extends RemoteArticleState {
  const RemoteArticlesDone(List<ArticleEntity> articles)
    : super(articles: articles);
}

class RemoteArticlesError extends RemoteArticleState {
  const RemoteArticlesError(DioException exception)
    : super(exception: exception);
}
