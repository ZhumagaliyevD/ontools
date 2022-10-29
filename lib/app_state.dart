import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
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

  DateTime? birthday = DateTime.fromMillisecondsSinceEpoch(1665846180000);

  LatLng? address = LatLng(40.18597, 44.515109);

  DateTime? toolBuyDate = DateTime.fromMillisecondsSinceEpoch(1665846120000);

  String toolimg = '';

  String profileimg =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/on-tools-afj9b2/assets/7jg4gg5vbuxs/account.png';

  String noteIMG = '';

  bool SearchList = false;

  List<DocumentReference> isDone = [];

  String chequeName = '';

  String chequeFile = '';

  String filterToolName = '';

  String filterShopName = '';

  String isCheque = '';

  String sortBy = '';

  bool isCheckbox = false;

  String noteNameSearch = '';

  String MarketplaceSearch = '';

  List<DocumentReference> photoNotePoints = [
    FirebaseFirestore.instance.doc('/photo_note_point/SvzqjFTYLedGq2VTTxx4')
  ];
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
