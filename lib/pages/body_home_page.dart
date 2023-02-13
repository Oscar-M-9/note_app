
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/notes_model.dart';
import '../providers/note_provider.dart';
import 'update_note.dart';

class BodyPage extends StatefulWidget {
  const BodyPage({super.key});

  @override
  State<BodyPage> createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  late Future<List<Note>> futureData;
  @override
  void initState() {
    futureData = context.read<NoteProvider>().allNote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final noteProvider = context.watch<NoteProvider>();

    return FutureBuilder<List<Note>>(
      future: futureData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return ListView.builder(
            padding: const EdgeInsets.all(5)
                .copyWith(bottom: MediaQuery.of(context).size.height * 0.06),
            itemCount: noteProvider.note.length,
            itemBuilder: (context, index) {
              final data = noteProvider.note[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateNotePage(note: data),
                        ),
                      );
                    },
                    title: Text(
                      data.title!,
                      overflow: TextOverflow.ellipsis,
                      textHeightBehavior: const TextHeightBehavior(
                        applyHeightToFirstAscent: false,
                        applyHeightToLastDescent: false,
                      ),
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        data.body!,
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textHeightBehavior: const TextHeightBehavior(
                          applyHeightToLastDescent: false,
                          applyHeightToFirstAscent: false,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(
            child: Text('No hay notas aún'),
          );
        }
      },
    );
  }
}
