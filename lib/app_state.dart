import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  late SharedPreferences prefs;

  DateTime? _birthday = DateTime.fromMillisecondsSinceEpoch(1665846180000);
  DateTime? get birthday => _birthday;
  set birthday(DateTime? _value) {
    notifyListeners();
    if (_value == null) {
      return;
    }
    _birthday = _value;
  }

  LatLng? _address = LatLng(40.18597, 44.515109);
  LatLng? get address => _address;
  set address(LatLng? _value) {
    notifyListeners();
    if (_value == null) {
      return;
    }
    _address = _value;
  }

  DateTime? _toolBuyDate = DateTime.fromMillisecondsSinceEpoch(1665846120000);
  DateTime? get toolBuyDate => _toolBuyDate;
  set toolBuyDate(DateTime? _value) {
    notifyListeners();
    if (_value == null) {
      return;
    }
    _toolBuyDate = _value;
  }

  String _toolimg = '';
  String get toolimg => _toolimg;
  set toolimg(String _value) {
    notifyListeners();

    _toolimg = _value;
  }

  String _profileimg =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/on-tools-afj9b2/assets/7jg4gg5vbuxs/account.png';
  String get profileimg => _profileimg;
  set profileimg(String _value) {
    notifyListeners();

    _profileimg = _value;
  }

  String _noteIMG = '';
  String get noteIMG => _noteIMG;
  set noteIMG(String _value) {
    notifyListeners();

    _noteIMG = _value;
  }

  bool _SearchList = false;
  bool get SearchList => _SearchList;
  set SearchList(bool _value) {
    notifyListeners();

    _SearchList = _value;
  }

  List<DocumentReference> _isDone = [];
  List<DocumentReference> get isDone => _isDone;
  set isDone(List<DocumentReference> _value) {
    notifyListeners();

    _isDone = _value;
  }

  void addToIsDone(DocumentReference _value) {
    notifyListeners();
    _isDone.add(_value);
  }

  void removeFromIsDone(DocumentReference _value) {
    notifyListeners();
    _isDone.remove(_value);
  }

  String _chequeName = '';
  String get chequeName => _chequeName;
  set chequeName(String _value) {
    notifyListeners();

    _chequeName = _value;
  }

  String _chequeFile = '';
  String get chequeFile => _chequeFile;
  set chequeFile(String _value) {
    notifyListeners();

    _chequeFile = _value;
  }

  String _filterToolName = '';
  String get filterToolName => _filterToolName;
  set filterToolName(String _value) {
    notifyListeners();

    _filterToolName = _value;
  }

  String _filterShopName = '';
  String get filterShopName => _filterShopName;
  set filterShopName(String _value) {
    notifyListeners();

    _filterShopName = _value;
  }

  String _isCheque = '';
  String get isCheque => _isCheque;
  set isCheque(String _value) {
    notifyListeners();

    _isCheque = _value;
  }

  String _sortBy = '';
  String get sortBy => _sortBy;
  set sortBy(String _value) {
    notifyListeners();

    _sortBy = _value;
  }

  bool _isCheckbox = false;
  bool get isCheckbox => _isCheckbox;
  set isCheckbox(bool _value) {
    notifyListeners();

    _isCheckbox = _value;
  }

  String _noteNameSearch = '';
  String get noteNameSearch => _noteNameSearch;
  set noteNameSearch(String _value) {
    notifyListeners();

    _noteNameSearch = _value;
  }

  String _MarketplaceSearch = '';
  String get MarketplaceSearch => _MarketplaceSearch;
  set MarketplaceSearch(String _value) {
    notifyListeners();

    _MarketplaceSearch = _value;
  }

  List<DocumentReference> _photoNotePoints = [
    FirebaseFirestore.instance.doc('/photo_note_point/SvzqjFTYLedGq2VTTxx4')
  ];
  List<DocumentReference> get photoNotePoints => _photoNotePoints;
  set photoNotePoints(List<DocumentReference> _value) {
    notifyListeners();

    _photoNotePoints = _value;
  }

  void addToPhotoNotePoints(DocumentReference _value) {
    notifyListeners();
    _photoNotePoints.add(_value);
  }

  void removeFromPhotoNotePoints(DocumentReference _value) {
    notifyListeners();
    _photoNotePoints.remove(_value);
  }

  double _dx = 0.0;
  double get dx => _dx;
  set dx(double _value) {
    notifyListeners();

    _dx = _value;
  }

  double _dy = 0.0;
  double get dy => _dy;
  set dy(double _value) {
    notifyListeners();

    _dy = _value;
  }

  String _comment = '';
  String get comment => _comment;
  set comment(String _value) {
    notifyListeners();

    _comment = _value;
  }

  String _chequeImg = '';
  String get chequeImg => _chequeImg;
  set chequeImg(String _value) {
    notifyListeners();

    _chequeImg = _value;
  }

  bool _viewPhoto = false;
  bool get viewPhoto => _viewPhoto;
  set viewPhoto(bool _value) {
    notifyListeners();

    _viewPhoto = _value;
  }

  DateTime? _reportStart = DateTime.fromMillisecondsSinceEpoch(1670753400000);
  DateTime? get reportStart => _reportStart;
  set reportStart(DateTime? _value) {
    notifyListeners();
    if (_value == null) {
      return;
    }
    _reportStart = _value;
  }

  DateTime? _reportEnd = DateTime.fromMillisecondsSinceEpoch(1670839800000);
  DateTime? get reportEnd => _reportEnd;
  set reportEnd(DateTime? _value) {
    notifyListeners();
    if (_value == null) {
      return;
    }
    _reportEnd = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
