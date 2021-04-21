import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculasProvider {
  String _apikey = 'b539f5fcaaecff49297a8cb048a25934';
  String _url = 'api.themoviedb.org';
  String _languaje = 'es-ES';

  Future<List<Pelicula>> getOnTheater() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apikey,
      'languaje': _languaje,
    });
    final resp = await http.get(url);

    final decodeData = json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(decodeData['results']);

    return peliculas.items;

  }
}
