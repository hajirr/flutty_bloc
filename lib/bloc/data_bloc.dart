import 'package:bloc/bloc.dart';
import 'package:flutty_bloc/bloc/data_event.dart';
import 'package:flutty_bloc/bloc/data_state.dart';
import 'package:flutty_bloc/data/network_api.dart';
import 'package:flutty_bloc/model/news_article.dart';

//Jika menggunakan Bloc
class DataBloc extends Bloc<DataEvent, DataState> {
  final dataServices = NetworkApi();
  DataBloc() : super(InitialDataState()) {
    on<LoadDataEvent>((event, emit) async {
      emit(LoadingDataState());
      List<Article> articleTopHeadline = [];
      List<Article> articleInvestment = [];
      List<Article> articleTechnology = [];
      try {
        articleTopHeadline = await dataServices.getNewsTopHeadline();
        articleInvestment = await dataServices.getNewsInvestment();
        articleTechnology = await dataServices.getNewsTechnology();
        emit(LoadedDataState(
            articleTopHeadline: articleTopHeadline,
            articleInvestment: articleInvestment,
            articleTechnology: articleTechnology));
      } catch (e) {
        emit(FailedToLoadDataState(error: e));
      }
    });
  }
}
