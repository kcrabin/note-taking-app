class NoteForListing {
  String noteID;
  String noteTitle;
  DateTime createdDateTime;
  DateTime lastEditedDateTime;

  NoteForListing({
    this.noteID = '',
    this.noteTitle = '',
    required this.createdDateTime,
    required this.lastEditedDateTime,
  });
}
