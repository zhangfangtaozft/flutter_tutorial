import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';

const _root = 'https://hacker-news.firebaseio.com/v0/';

class NewsApiProvider {
  Client client = Client();

  fetchTopIds() async {
    final response = await client.get(Uri.dataFromString('$_root/topstories.json'));
    final ids = json.decode(response.body);
    return ids;
  }

  fetchItems(int id) async {
    final response = await client.get(Uri.dataFromString('$_root/item/$id.json'));
    final parsedJson = json.decode(response.body);
    return ItemModel.fromJson(parsedJson);
  }
}