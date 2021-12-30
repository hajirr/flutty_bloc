import 'package:bloc/bloc.dart';
import 'package:flutty_bloc/data/network-api.dart';
import 'package:flutty_bloc/model/news.dart';

class DataCubit extends Cubit<List<Article>> {
  DataCubit() : super([]);

  final dataServices = NetworkApi();

  void getNewsArticle() async => emit(await dataServices.getNewsArticle());
}
