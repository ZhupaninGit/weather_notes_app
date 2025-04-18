import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_notes_app/core/router/router.dart';
import 'package:weather_notes_app/data/models/note.dart';
import 'package:weather_notes_app/features/home/view/bloc/notes_bloc/notes_bloc.dart';

class NotesListWidget extends StatelessWidget {
  const NotesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesBloc, NotesState>(
      builder: (context, state) {
        if (state is NotesLoadingState) {
          return const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is NotesLoadedState) {
          if (state.notes.isEmpty) {
            return _EmptyNotesWidget();
          }
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.navigateTo(CreateOrUpdateNoteRoute(note: state.notes[index]));
                  },
                  child: _NoteCardWidget(
                    note: state.notes[index],
                  ),
                );
              },
              childCount: state.notes.length,
            ),
          );
        } else if (state is NotesLoadFailureState) {
          return Text("Error occured during getting your notes...");
        }
        return SizedBox.shrink();
      },
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
