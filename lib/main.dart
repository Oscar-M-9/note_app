import 'package:flutter/material.dart';
import 'package:notes_app_flutter/pages/add_note.dart';
import 'package:notes_app_flutter/pages/home.dart';
import 'package:notes_app_flutter/providers/note_provider.dart';
import 'package:notes_app_flutter/utils/my_colors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NoteProvider(),
        )
      ],
      child: MaterialApp(
        themeMode: ThemeMode.system,
        darkTheme: ThemeData.dark(
          useMaterial3: true
        ),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            color: MyColors.primary,
            foregroundColor: Colors.white,
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const HomePage(),
          '/addNote':(_) => const AddNotePage(),
        },
      ),
    );
  }
}
