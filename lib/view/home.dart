import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutty_bloc/bloc/DataCubit.dart';
import 'package:flutty_bloc/model/news.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DataCubit, List<Article>>(builder: (context, news) {
        if (news.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
            itemCount: news.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(
                    news[index].title,
                    style: GoogleFonts.poppins(),
                  ),
                  subtitle: Text(
                    news[index].content,
                    style: GoogleFonts.poppins(),
                  ),
                ),
              );
            });
      }),
    );
  }
}
