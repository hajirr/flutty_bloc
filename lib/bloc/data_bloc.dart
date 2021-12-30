import 'package:bloc/bloc.dart';
import 'package:flutty_bloc/bloc/data_event.dart';
import 'package:flutty_bloc/bloc/data_state.dart';
import 'package:flutty_bloc/data/network-api.dart';

//Jika menggunakan Bloc
class DataBloc extends Bloc<DataEvent, DataState> {
  final dataServices = NetworkApi();
  DataBloc() : super(LoadingDataState()) {
    on<LoadDataEvent>((event, emit) async {
      emit(LoadedDataState(article: await dataServices.getNewsArticle()));
    });
  }
}
