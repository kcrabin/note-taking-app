import 'package:note_taking_app/models/note_for_listing.dart';

class NoteService {
  List<NoteForListing> getNotesList() {
    return [
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
  }
}
