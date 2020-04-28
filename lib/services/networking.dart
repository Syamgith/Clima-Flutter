import 'dart:convert';

import 'package:http/http.dart' as htpp;

class NetworkHelper {
  NetworkHelper(this.url);
  String url;

  Future getData() async {
    htpp.Response response = await htpp.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
