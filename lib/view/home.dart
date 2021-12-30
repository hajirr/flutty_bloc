import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutty_bloc/bloc/data_bloc.dart';
import 'package:flutty_bloc/bloc/data_event.dart';
import 'package:flutty_bloc/bloc/data_state.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> refresh() async =>
      context.read<DataBloc>()..add(LoadDataEvent());
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          body: RefreshIndicator(
        onRefresh: refresh,
        child: Container(
            width: width,
            height: height,
            decoration: const BoxDecoration(color: Colors.black),
            child: BlocBuilder<DataBloc, DataState>(
              builder: (context, state) {
                if (state is LoadingDataState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is FailedToLoadDataState) {
                  return Center(
                    child: Text(
                      "Terjadi kesalahan ${state.error}",
                      style: GoogleFonts.poppins(),
                    ),
                  );
                } else if (state is LoadedDataState) {
                  return ListView.builder(
                      itemCount: state.article.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(state.article[index].title),
                            subtitle: Text(state.article[index].content),
                          ),
                        );
                      });
                } else {
                  return const SizedBox();
                }
              },
            )),
      )),
    );
  }
}
