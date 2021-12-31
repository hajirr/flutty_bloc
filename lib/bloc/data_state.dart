import 'package:flutty_bloc/model/news_article.dart';

abstract class DataState {}

class InitialDataState extends DataState {}

class LoadingDataState extends DataState {}

class LoadedDataState extends DataState {
  List<Article> articleTopHeadline;
  List<Article> articleInvestment;
  List<Article> articleTechnology;
  LoadedDataState(
      {required this.articleTopHeadline,
      required this.articleInvestment,
      required this.articleTechnology});
}

class FailedToLoadDataState extends DataState {
  Object error;
  FailedToLoadDataState({required this.error});
}
