import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ny_times_app/presentation/providers/article_provider.dart';
import 'package:provider/provider.dart';

import 'core/utils/dependency_injection.dart';
import 'core/utils/dependency_injection.dart' as di;
import 'presentation/views/articles/articles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => sl<ArticleProvider>(),
        ),
      ],
      child: MaterialApp(
        title: 'NY Times',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            foregroundColor: Colors.white,
            backgroundColor: Colors.greenAccent,
          ),
        ),
        home: const ArticlesScreen(),
      ),
    );
  }
}
