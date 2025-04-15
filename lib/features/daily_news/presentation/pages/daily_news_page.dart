import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:news_clean_architecture/features/daily_news/presentation/widgets/article_widget.dart';

class DailyNewsPage extends StatelessWidget {
  const DailyNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppbar(), body: _buildBody());
  }

  _buildAppbar() => AppBar(title: Text('Daily News'), centerTitle: true);

  _buildBody() => BlocBuilder<RemoteArticlesBloc, RemoteArticleState>(
    builder: (_, state) {
      if (state is RemoteArticlesLoading) {
        return Center(child: CircularProgressIndicator());
      }
      if (state is RemoteArticlesError) {
        return Center(child: Icon(Icons.refresh));
      }
      if (state is RemoteArticlesDone) {
        return ListView.builder(
          itemCount: state.articles!.length,
          itemBuilder:
              (context, index) =>
                  ArticleWidget(article: state.articles![index]),
        );
      }
      return SizedBox();
    },
  );
}
