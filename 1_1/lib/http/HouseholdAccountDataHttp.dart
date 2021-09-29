import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../entity/HouseholdAccountData.dart';

class HouseholdAccountDataHttp {
  static Uri uri = Uri.parse('https://script.google.com/macros/s/AKfycbwqSD3jNHnUvG30N0CKJyLEwqTtdRCs9ewuVTHDAOqf3dzea7_L/exec');

  static Future<List<HouseholdAccountData>> getHouseholdAccountDataList() async {
  }

  static void saveHouseholdAccountData(HouseholdAccountData data) async {
  }
}
