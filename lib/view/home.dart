import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutty_bloc/bloc/data_bloc.dart';
import 'package:flutty_bloc/bloc/data_event.dart';
import 'package:flutty_bloc/bloc/data_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "FluttyNews",
              style: GoogleFonts.poppins(),
            ),
            centerTitle: true,
            elevation: 0,
          ),
          body: SizedBox(
              width: width,
              height: height,
              child: Column(
                children: [
                  TabBar(
                      indicatorColor: Colors.black,
                      labelStyle:
                          GoogleFonts.ubuntu(fontWeight: FontWeight.w600),
                      labelColor: Colors.black,
                      tabs: const [
                        Tab(
                          text: "Trending",
                        ),
                        Tab(
                          text: "Investasi",
                        ),
                        Tab(
                          text: "Teknologi",
                        ),
                      ]),
                  SizedBox(
                    height: height * 0.8,
                    child: TabBarView(
                      children: [
                        RefreshIndicator(
                          onRefresh: refresh,
                          child: BlocBuilder<DataBloc, DataState>(
                            builder: (context, state) {
                              if (state is LoadingDataState) {
                                return Center(
                                  child:
                                      Lottie.asset("assets/json/loading.json"),
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
                                    itemCount: state.articleTopHeadline.length,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        child: Column(
                                          children: [
                                            CachedNetworkImage(
                                              imageUrl: state
                                                  .articleTopHeadline[index]
                                                  .urlToImage,
                                              placeholder: (context, url) =>
                                                  Lottie.asset(
                                                      "assets/json/loading.json"),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                            ListTile(
                                              title: Text(state
                                                  .articleTopHeadline[index]
                                                  .title),
                                              subtitle: Text(state
                                                  .articleTopHeadline[index]
                                                  .content),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              } else {
                                return const SizedBox();
                              }
                            },
                          ),
                        ),
                        RefreshIndicator(
                          onRefresh: refresh,
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
                                    itemCount: state.articleInvestment.length,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        child: Column(
                                          children: [
                                            CachedNetworkImage(
                                              imageUrl: state
                                                  .articleInvestment[index]
                                                  .urlToImage,
                                              placeholder: (context, url) =>
                                                  Lottie.asset(
                                                      "assets/json/loading.json"),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                            ListTile(
                                              title: Text(state
                                                  .articleInvestment[index]
                                                  .title),
                                              subtitle: Text(state
                                                  .articleInvestment[index]
                                                  .content),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              } else {
                                return const SizedBox();
                              }
                            },
                          ),
                        ),
                        RefreshIndicator(
                          onRefresh: refresh,
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
                                    itemCount: state.articleTechnology.length,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        child: Column(
                                          children: [
                                            CachedNetworkImage(
                                              imageUrl: state
                                                  .articleTechnology[index]
                                                  .urlToImage,
                                              placeholder: (context, url) =>
                                                  Lottie.asset(
                                                      "assets/json/loading.json"),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                            ListTile(
                                              title: Text(state
                                                  .articleTechnology[index]
                                                  .title),
                                              subtitle: Text(state
                                                  .articleTechnology[index]
                                                  .content),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              } else {
                                return const SizedBox();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ))),
    );
  }
}
