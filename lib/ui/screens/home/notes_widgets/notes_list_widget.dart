import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_notes_app/domain/models/note.dart';
import 'package:weather_notes_app/ui/screens/home/notes_widgets/create_or_update_note_widget.dart';
import 'package:weather_notes_app/ui/view_models/notes_view_model.dart';

class NotesListWidget extends StatelessWidget {
  const NotesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NotesViewModel>();

    if (viewModel.notes.isEmpty) {
      return const _EmptyNotesWidget();
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => CreateOrUpdateNoteScreen(
                  note: viewModel.notes[index],
                ),
              ));
            },
            child: _NoteCardWidget(
              note: viewModel.notes[index],
            ),
          );
        },
        childCount: viewModel.notes.length,
      ),
    );
  }
}

class _EmptyNotesWidget extends StatelessWidget {
  const _EmptyNotesWidget();

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Text(
          "Create your first note.",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}

class _NoteCardWidget extends StatelessWidget {
  const _NoteCardWidget({
    required this.note,
  });

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            note.title.isNotEmpty
                ? Text(
                    note.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : SizedBox.shrink(),
            const SizedBox(height: 8),
            note.body.isNotEmpty
                ? Text(
                    note.body,
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                  )
                : SizedBox.shrink(),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                DateFormat('d MMM, HH:mm').format(note.lastInteracted),
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
