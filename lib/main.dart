import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:pickle_rick/core/di/dependency_injector.dart';
import 'package:pickle_rick/core/routes/routes.dart';
import 'package:pickle_rick/presentation/characteres/view/characteres_page.dart';
import 'package:pickle_rick/presentation/characteres/provider/characteres_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  DependencyInjector().setup();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GetIt.instance<CharacteresListProvider>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pickle Rick App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: Routes.routes,
      home: const CharacteresPage(),
    );
  }
}
