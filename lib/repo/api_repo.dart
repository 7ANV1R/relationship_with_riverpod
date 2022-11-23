import 'dart:convert';
import 'dart:developer';

import 'package:all_provider/model/sug_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

final apiServiceProvider = Provider(
  (ref) => ApiRepo(
    dioClient: Client(),
  ),
);

class ApiRepo {
  final Client _client;

  ApiRepo({required Client dioClient}) : _client = dioClient;

  Future<Suggestion> getSuggestion() async {
    try {
      var response = await _client.get(Uri.parse('https://www.boredapi.com/api/activity'));
      return Suggestion.fromJson(
        jsonEncode(
          jsonDecode(response.body),
        ),
      );
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }
}
