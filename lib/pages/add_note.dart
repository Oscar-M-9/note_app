import 'package:flutter/material.dart';
import 'package:notes_app_flutter/pages/widgets/text_field_custom.dart';
import 'package:notes_app_flutter/providers/note_provider.dart';
import 'package:provider/provider.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    final claveFormulario = GlobalKey<FormState>();
    final titleController = TextEditingController();
    final bodyController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                if (!claveFormulario.currentState!.validate()) {
                  return;
                }
                final providerNote =
                    Provider.of<NoteProvider>(context, listen: false);
                providerNote.insertNote(
                  titleController.text,
                  bodyController.text,
                );
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
            key: claveFormulario,
            child: Column(
              children: [
                TextFieldCustom(
                  fontSize: 24,
                  hintText: 'Titulo',
                  fontWeight: FontWeight.w500,
                  keyboardType: TextInputType.text,
                  onChanged: (value) => titleController.text = value,
                  validator: (value) {
                    return (value!.isEmpty) ? 'Agrege un titulo' : null;
                  },
                ),
                TextFieldCustom(
                  fontSize: 16,
                  hintText: 'Empiece a escribir',
                  keyboardType: TextInputType.multiline,
                  onChanged: (value) => bodyController.text = value,
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
