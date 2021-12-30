import 'package:flutty_bloc/model/news.dart';

abstract class DataState {}

class LoadingDataState extends DataState {}

class LoadedDataState extends DataState {
  List<Article> article;
  LoadedDataState({required this.article});
}

class FailedToLoadDataState extends DataState {
  Object error;
  FailedToLoadDataState({required this.error});
}
