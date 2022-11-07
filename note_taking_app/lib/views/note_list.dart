import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:note_taking_app/models/note_for_listing.dart';
import 'package:note_taking_app/services/note_service.dart';
import 'package:note_taking_app/views/note_delete.dart';
import 'package:note_taking_app/views/note_modify.dart';

class NoteList extends StatefulWidget {
  NoteList({Key? key}) : super(key: key);

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  NoteService get service => GetIt.I<NoteService>();
  List<NoteForListing> notes = [];

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  void initState() {
    super.initState();
    notes = service.getNotesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of notes'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => NoteModify(),
            ),
          );
        },
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
                child: Dismissible(
                  key: ValueKey(notes[index].noteID),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction) {},
                  confirmDismiss: (direction) async {
                    final result = await showDialog(
                      context: context,
                      builder: (context) => NoteDelete(),
                    );
                    print(result);
                    return result;
                  },
                  background: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.only(left: 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  child: ListTile(
                    // onLongPress: () async {
                    //   final result = await showDialog(
                    //     context: context,
                    //     builder: (context) => NoteDelete(),
                    //   );
                    //   print(result);
                    //   return result;
                    // },
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => NoteModify(
                            noteID: notes[index].noteID,
                          ),
                        ),
                      );
                    },
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
            ),
          );
        },
        itemCount: notes.length,
      ),
    );
  }
}
