import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc_example/core/constantas/urls.dart';
import 'package:flutter_bloc_example/model/user_model.dart';

class RemoteService {
  static Future getUsers() async {
    try {
      Response response = await Dio().get(BaseUrl.url);
      if (response.statusCode == HttpStatus.ok) {
        var resData =
            (response.data as List).map((e) => UserModel.fromJson(e)).toList();
        return resData;
      }
    } catch (e) {
      return e.toString();
    }
  }
}
