import 'dart:convert';
import 'package:covid19app/view/countries_list.dart';
import 'package:covid19app/Model/world_states_model.dart';
import 'package:covid19app/Services/Utilities/app_url.dart';

import 'package:http/http.dart' as http;

class StatesServices {
  Future<WorldStatesModel> fetchWorldStatesModelRecord() async {
    final response = await http.get(Uri.parse(Appurl.worldStatesApi));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print('API Response Data: $data');
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> countriesListApi() async {
    var data;
    final response = await http.get(Uri.parse(Appurl.countriesList));
    print(response.statusCode.toString());
    print(data);

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
      return data;
    } else {
      throw Exception('Error');
    }
  }
}
