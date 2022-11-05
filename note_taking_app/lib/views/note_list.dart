import 'package:flutter/material.dart';
import 'package:note_taking_app/models/note_for_listing.dart';

class NoteList extends StatelessWidget {
  NoteList({Key? key}) : super(key: key);

  final notes = [
    new NoteForListing(
      noteID: '1',
      noteTitle: 'Note 1',
      createdDateTime: DateTime.now(),
      lastEditedDateTime: DateTime.now(),
    ),
    new NoteForListing(
      noteID: '2',
      noteTitle: 'Note 2',
      createdDateTime: DateTime.now(),
      lastEditedDateTime: DateTime.now(),
    ),
    new NoteForListing(
      noteID: '3',
      noteTitle: 'Note 3',
      createdDateTime: DateTime.now(),
      lastEditedDateTime: DateTime.now(),
    )
  ];

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of notes'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              elevation: 20,
              shadowColor: Colors.black.withAlpha(70),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: ListTile(
                  title: Text(
                    notes[index].noteTitle,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  subtitle: Text(
                      'Last edited on ${formatDateTime(notes[index].lastEditedDateTime)}'),
                  focusColor: Colors.grey,
                ),
              ),
            ),
          );
        },
        itemCount: notes.length,
      ),
    );
  }
}
