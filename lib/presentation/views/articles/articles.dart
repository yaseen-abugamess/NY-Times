import 'package:flutter/material.dart';
import 'package:ny_times_app/presentation/providers/article_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/enumeration.dart';
import '../../widgets/loading_widget.dart';
import 'widgets/article_widget.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,
        () async => context.read<ArticleProvider>().getArticles());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NY Times Most Popular Articles'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_outlined),
          ),
        ],
      ),
      drawer: const Drawer(),
      body: Consumer<ArticleProvider>(
        builder: (context, model, child) {
          if (model.loading == NotifierSate.loading) {
            return const LoadingWidget();
          }
          if (model.articles.isEmpty) {
            return const Center(
              child: Text('Articles are Empty'),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) => ArticleWidget(
              article: model.articles[index],
            ),
            itemCount: model.articles.length,
          );
        },
      ),
    );
  }
}
