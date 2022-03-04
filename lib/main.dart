import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ideago/application/ideas/ideas_cubit.dart';

import 'constants.dart';
import 'data/models/idea/idea.dart';
import 'presentation/pages/home_page.dart';
import 'repository/ideas_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Hive.initFlutter();
  Hive.registerAdapter(IdeaAdapter());
  await Hive.openBox<Idea>(kBoxName);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late IdeasRepository _ideasRepository;

  @override
  void initState() {
    super.initState();
    _ideasRepository = IdeasRepository();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IdeasCubit(_ideasRepository)..getAllIdeas(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'IdeaGo',
        home: HomePage(),
      ),
    );
  }
}
