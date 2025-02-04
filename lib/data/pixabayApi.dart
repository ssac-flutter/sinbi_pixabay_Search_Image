import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:search_image/data/model/pixabay.dart';

class PixabayApi {
  static const apiKey = '37726328-4a2b1a654b17d6bad1ec74dba';
  static const pixabayUrl = 'https://pixabay.com/api/?key=$apiKey';

  Future<Pixabay> getPixabay(String query, int id) async {
    final response =
        await http.get(Uri.parse('$pixabayUrl&q=$query&image_type=all'));

    return Pixabay.fromJson(
        jsonDecode(response.body)['hits']['$id']['previewURL']);
  }

  Future<List<Pixabay>> getPixabays(String query) async {
    final response =
        await http.get(Uri.parse('$pixabayUrl&q=$query&image_type=all'));

    Iterable jsonArray = jsonDecode(response.body)['hits'];

    return jsonArray.map((e) => Pixabay.fromJson(e)).toList();
  }
}
