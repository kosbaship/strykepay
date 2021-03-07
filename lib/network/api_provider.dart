import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:strykepay/shared/constants.dart';

class APIProvider{
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: kBASE_URL,
      headers: {
        'Content-Type': 'application/json',
      },
    ),

  );

   static Future<Response> fetchData({@required String path, data}) async {

     (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
         (HttpClient client) {
       client.badCertificateCallback =
           (X509Certificate cert, String host, int port) => true;
       return client;
     };

     try {
       return await dio.post(path, data: data ?? null);
     } catch (e) {
       print('\n=========================================================');
       print(e);
       print('===========================DIO===========================\n\n');
       return(e);
     }

  }
}
