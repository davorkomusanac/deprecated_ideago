import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ideago/application/ideas/ideas_cubit.dart';
import 'package:ideago/data/models/question_rating/question_rating.dart';

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
  Hive.registerAdapter(QuestionRatingAdapter());
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
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'IdeaGo',
        theme: ThemeData.dark().copyWith(
          cardColor: Colors.teal,
          scaffoldBackgroundColor: Colors.blueGrey[900],
          inputDecorationTheme: InputDecorationTheme(
            floatingLabelStyle: const TextStyle(color: Colors.teal),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.teal, width: 2.0),
              borderRadius: BorderRadius.circular(25.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
