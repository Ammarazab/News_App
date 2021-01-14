class BoardingHomeModel {
  String _title;
  String _image;
   String _description;

  BoardingHomeModel(this._title, this._image, this._description );

  String get image => _image;
  String get description => _description;

  String get title => _title;
}