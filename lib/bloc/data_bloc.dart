import 'package:bloc/bloc.dart';
import 'package:flutty_bloc/bloc/data_event.dart';
import 'package:flutty_bloc/bloc/data_state.dart';
import 'package:flutty_bloc/data/network_api.dart';
import 'package:flutty_bloc/model/news.dart';

//Jika menggunakan Bloc
class DataBloc extends Bloc<DataEvent, DataState> {
  final dataServices = NetworkApi();
  DataBloc() : super(InitialDataState()) {
    on<LoadDataEvent>((event, emit) async {
      emit(LoadingDataState());
      List<Article> article = [];
      try {
        article = await dataServices.getNewsArticle();
        emit(LoadedDataState(article: article));
      } catch (e) {
        emit(FailedToLoadDataState(error: e));
      }
    });
  }
}
