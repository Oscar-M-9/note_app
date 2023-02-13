import 'package:flutter/material.dart';
import 'package:notes_app_flutter/pages/widgets/text_field_custom.dart';
import 'package:notes_app_flutter/providers/note_provider.dart';
import 'package:notes_app_flutter/utils/my_colors.dart';
import 'package:provider/provider.dart';

import '../models/notes_model.dart';

class UpdateNotePage extends StatefulWidget {
  final Note note;
  const UpdateNotePage({
    super.key,
    required this.note,
  });

  @override
  State<UpdateNotePage> createState() => _UpdateNotePageState();
}

class _UpdateNotePageState extends State<UpdateNotePage> {
  GlobalKey<FormState> claveFormulario2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final data = widget.note;
    // final Object? args = ModalRoute.of(context)!.settings.arguments;

    final titleController = TextEditingController(text: data.title);
    final bodyController = TextEditingController(text: data.body);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => AlertDialog(
                  title: const Align(
                    alignment: Alignment.center,
                    child: Text('Eliminar nota'),
                  ),
                  content: const Text('¿Eliminar esta nota?',textAlign: TextAlign.center),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          child: const Text('Cancelar'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        MaterialButton(
                          onPressed: () {
                            final providerNote = Provider.of<NoteProvider>(
                                context,
                                listen: false);
                            providerNote.deleteNote(data.key);
                            providerNote.allNote();
                            Navigator.of(context)
                              ..pop()
                              ..pop();
                          },
                          elevation: 0,
                          highlightElevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)
                          ),
                          padding: const EdgeInsets.all(10.0),
                          color: MyColors.primary,
                          child: const Text('Aceptar'),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
            icon: const Icon(
              Icons.delete_forever,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                if (!claveFormulario2.currentState!.validate()) {
                  return;
                }
                final providerNote =
                    Provider.of<NoteProvider>(context, listen: false);
                providerNote.updateNote(
                  data.key,
                  titleController.text,
                  bodyController.text,
                );
                providerNote.allNote();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.check),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 10),
          child: Form(
            key: claveFormulario2,
            child: Column(
              children: [
                TextFieldCustom(
                  fontSize: 24,
                  hintText: 'Titulo',
                  fontWeight: FontWeight.w500,
                  keyboardType: TextInputType.text,
                  controller: titleController,
                  validator: (value) {
                    return (value!.isEmpty) ? 'Agrege un titulo' : null;
                  },
                ),
                TextFieldCustom(
                  fontSize: 16,
                  hintText: 'Empiece a escribir',
                  minLines: 6,
                  keyboardType: TextInputType.multiline,
                  controller: bodyController,
                  validator: (value) {
                    return (value!.isEmpty) ? 'Escriba una nota' : null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
