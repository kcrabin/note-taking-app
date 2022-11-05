class NoteForListing {
  String noteID;
  String noteTitle;
  DateTime createdDateTime;
  DateTime lastEditedDateTime;

  NoteForListing({
    required this.noteID,
    required this.noteTitle,
    required this.createdDateTime,
    required this.lastEditedDateTime,
  });
}
