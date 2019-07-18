import 'dart:convert';
import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'env.dart';
import 'DataUtils.dart';

  ///Post请求，基于dio第三方库
  doPostDio(String url, Map<String,dynamic> params, void callback(bool isSuccess , Object responseData)) async{
    try{
      Options options = Options(method: 'POST'); // 设置请求方式
      options.connectTimeout = 60000; // 设置请求超时时间
      options.receiveTimeout = 60000; // 设置响应超时时间
      options.headers.addAll(getHeaders()); // 设置请求头
      Dio dio = Dio();
      dio.options.baseUrl = httpUrl;
      Response response = await dio.post(url, queryParameters: params, options: options);
      if(response.statusCode == HttpStatus.ok){ // 根据response状态判断
        callback(true, response.data);
      } else {
        callback(false, response.data);
      }
    }catch(error){
      callback(false, error);
    }
  }

  ///GET请求，基于dio第三方库
  doGetDio(String url, Map<String,dynamic> params, void callback(bool isSuccess , Object responseData)) async{
    try{
      Options options = Options(method: 'GET'); // 设置请求方式
      options.connectTimeout = 60000; // 设置请求超时时间
      options.receiveTimeout = 60000; // 设置响应超时时间
      options.headers.addAll(getHeaders()); // 设置请求头
      Dio dio = Dio();
      dio.options.baseUrl = httpUrl;
      Response response = await dio.get(url, options: options);
      if(response.statusCode == HttpStatus.ok){ // 根据response状态判断
        callback(true, response.data);
      } else {
        callback(false, response.data);
      }
    }catch(error){
      callback(false, error);
    }
  }

  ///Post请求 使用http.dart库，对content-type没有格式内容要求可使用
  doPost(String url, Map<String,dynamic> params, void callback(bool isSuccess , Object responseData)) async{
    try{
      var uuid = new Uuid();
      String token = getAsyncData('token').toString();
      final http.Response response = await http.post(
        httpUrl + url,
        body: params,
        headers:{
          'Accept': '*/*',
          'content-type': 'application/x-www-form-urlencoded;charset=UTF-8',
//          'x-request-uuid': uuid.v4().toString(),
//          'x-auth-token': token
        },
        encoding: utf8);
      final Map<String, dynamic> responseData = json.decode(response.body);
      callback(true, responseData);
    }catch(error){
      callback(false, error);
    }
  }

  ///GET请求 使用http.dart库，对content-type没有格式内容要求可使用
  doGet(String url, Map<String,dynamic> params, void callback(bool isSuccess , Object responseData)) async{
    try{
      var uuid = new Uuid();
      var token = getAsyncData('token');
      final http.Response response = await http.get(
        httpUrl + url,
        headers:{
          'Accept': '*/*',
          'content-type': 'application/x-www-form-urlencoded;charset=UTF-8',
//          'x-request-uuid': uuid.v4(),
//          'x-auth-token': token
        },
      );
      final Map<String, dynamic> responseData = json.decode(response.body);
      callback(true, responseData);
    }catch(error){
      callback(false, error);
    }
  }

  ///获取请求头
  getHeaders() {
    var uuid = new Uuid();
    try{
      String token = getAsyncData('token').toString();
      return {
        'Accept': '*/*',
        'content-type': 'application/json',
        'x-request-uuid': uuid.v4(),
        'x-auth-token': token
      };
    } catch(error){
      return {
        'Accept': '*/*',
        'content-type': 'application/json',
        'x-request-uuid': uuid.v4(),
        'x-auth-token': ''
      };
    }
  }