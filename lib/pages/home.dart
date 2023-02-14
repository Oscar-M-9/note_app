import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app_flutter/pages/widgets/search_input.dart';
import 'package:notes_app_flutter/providers/note_provider.dart';
import 'package:notes_app_flutter/utils/my_colors.dart';
import 'package:provider/provider.dart';

import 'body_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Notes',
          style: GoogleFonts.chewy(
            fontSize: 26,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            SearchInput(
              hinText: 'Buscar nota',
              prefixIcon: const Icon(Icons.search),
              onChanged: (value) {
                final p = context.read<NoteProvider>();
                p.searchNote = value;
                p.search(value);
              },
            ),
            const Expanded(
              child: BodyPage(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addNote');
        },
        elevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        shape: const CircleBorder(),
        backgroundColor: MyColors.primary,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 35.0,
        ),
      ),
    );
  }
}
