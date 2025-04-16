import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';

import 'config/theme/app_themes.dart';
import 'features/daily_news/presentation/pages/daily_news_page.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create:
          (context) =>
              sl()..add(GetArticlesEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DailyNewsPage(),
        theme: theme(),
      ),
    );
  }
}
