import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../entity/HouseholdAccountData.dart';

class HouseholdAccountDataHttp {
  static Uri uri = Uri.parse('https://script.google.com/macros/s/AKfycbwqSD3jNHnUvG30N0CKJyLEwqTtdRCs9ewuVTHDAOqf3dzea7_L/exec');

  static Future<List<HouseholdAccountData>> getHouseholdAccountDataList() async {
    List<HouseholdAccountData> householdAccountData = [];

    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      var data = jsonResponse['data'];

      data.forEach((var item) {
        int id = int.parse(item['id']);
        int type = int.parse(item['type']);
        String detail = item['detail'];
        int cost = int.parse(item['cost']);

        householdAccountData.add(HouseholdAccountData(id, type, detail, cost));
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return householdAccountData;
  }

  static void saveHouseholdAccountData(HouseholdAccountData data) async {
  }
}
