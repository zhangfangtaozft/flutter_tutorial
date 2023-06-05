import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper {

  NetworkHelper(this.url);
  final Uri url;

  Future getData() async {
    Response response = await get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      var decoderData = jsonDecode(data);
      return decoderData;
    } else {
      print("请求失败了,请求连接),$response.statusCode");
    }
  }
}


