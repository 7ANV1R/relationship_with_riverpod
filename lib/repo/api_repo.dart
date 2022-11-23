import 'dart:convert';
import 'dart:developer';

import 'package:all_provider/model/sug_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServiceProvider = Provider(
  (ref) => ApiRepo(
    dioClient: Dio(),
  ),
);

class ApiRepo {
  final Dio _dioClient;

  ApiRepo({required Dio dioClient}) : _dioClient = dioClient;

  Future<Suggestion> getSuggestion() async {
    try {
      var response = await _dioClient.get('https://www.boredapi.com/api/activity');
      return Suggestion.fromJson(jsonDecode(response.data));
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }
}
