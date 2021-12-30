import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutty_bloc/bloc/data_bloc.dart';
import 'package:flutty_bloc/bloc/data_state.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DataBloc, DataState>(builder: (context, state) {
        if (state is LoadingDataState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LoadedDataState) {
          return ListView.builder(itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(
                  state.article[index].title,
                  style: GoogleFonts.poppins(),
                ),
                subtitle: Text(
                  state.article[index].content,
                  style: GoogleFonts.poppins(),
                ),
              ),
            );
          });
        } else if (state is FailedToLoadDataState) {
          return Center(
            child: Text(
              "Terjadi kesalahan ${state.error}",
              style: GoogleFonts.poppins(),
            ),
          );
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}
