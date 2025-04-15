import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_clean_architecture/core/resources/data_state.dart';
import 'package:news_clean_architecture/features/daily_news/domain/use_cases/get_article.dart';
import 'package:news_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class RemoteArticlesBloc extends Bloc<RemoteArticlesEvent, RemoteArticleState> {
  RemoteArticlesBloc(this.getArticleUseCase) : super(RemoteArticlesLoading()) {
    on<GetArticlesEvent>(onGetArticles);
  }

  final GetArticleUseCase getArticleUseCase;

  void onGetArticles(
    GetArticlesEvent event,
    Emitter<RemoteArticleState> emit,
  ) async {
    final dataState = await getArticleUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {

      emit(RemoteArticlesDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RemoteArticlesError(dataState.exception!));
    }
  }
}
