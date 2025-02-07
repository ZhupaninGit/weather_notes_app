import 'package:flutter/material.dart';
import 'package:weather_notes_app/domain/models/note.dart';
import 'package:weather_notes_app/ui/components/custom_snackbar.dart';
import 'package:weather_notes_app/ui/view_models/notes_view_model.dart';

class CreateOrUpdateNoteScreen extends StatefulWidget {
  final Note? note;

  const CreateOrUpdateNoteScreen({super.key, this.note});

  @override
  CreateOrUpdateNoteScreenState createState() =>
      CreateOrUpdateNoteScreenState();
}

class CreateOrUpdateNoteScreenState extends State<CreateOrUpdateNoteScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _model = NotesViewModel();

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _descriptionController.text = widget.note!.body;
    }
  }

  Future<void> _saveNote() async {
    final title = _titleController.text;
    final description = _descriptionController.text;

    if (title.isEmpty && description.isEmpty) {
      CustomSnackBar().showCustomSnackBar(context, "Please,provide some title or body.", true);
      return;
    }

    if (widget.note == null) {
      await _model.addNote(
        context,
        Note(
          title: title,
          body: description,
          lastInteracted: DateTime.now(),
        ),
      );
    } else {
      await _model.updateNote(
        context,
        Note(
          id: widget.note!.id,
          title: title,
          body: description,
          lastInteracted: DateTime.now(),
        ),
      );
    }
  }

  Future<void> _deleteNote() async {
    if (widget.note != null) {
      await _model.deleteNote(context, widget.note!.id!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.note != null;

    return Scaffold(
      appBar: AppBar(
        title: _TitleWidget(titleController: _titleController),
        actions: [
          IconButton(
            onPressed: _saveNote,
            icon: const Icon(Icons.done),
          ),
          if (isEditing)
            IconButton(
              onPressed: _deleteNote,
              icon: const Icon(Icons.delete),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: _descriptionController,
                maxLength: 1000,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter you note text here',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    required TextEditingController titleController,
  }) : _titleController = titleController;

  final TextEditingController _titleController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _titleController,
      maxLines: 1,
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: 'Title',
        labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
        floatingLabelStyle:
            TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
