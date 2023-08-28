import 'dart:convert';

import 'package:coronavirus_tracker_app/model/Worldstatesmodel.dart';
import 'package:coronavirus_tracker_app/screens/countries_list.dart';
import 'package:coronavirus_tracker_app/services/utilities/app_uri.dart';
import 'package:http/http.dart' as http;

class Stateservices {
  Future<worldStatesModel> worldstaterecored() async {
    final response = await http.get(Uri.parse(app_Uri.worldcountriesapi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return worldStatesModel.fromJson(data);
    } else {
      throw Exception('Error in api key');
    }
  }

  Future<List<dynamic>> countriesmodel() async {
    var data;
    final response = await http.get(Uri.parse(app_Uri.countrieslist));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Error in api key');
    }
  }
}
