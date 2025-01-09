import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_api/data/exception/app_exception.dart';

import 'base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiService implements BaseApiServices{


  @override
  Future addApi(String url,var data) async{
    dynamic responseJson;
    try{
      var response = await http.post(
        Uri.parse(url),
        body: data,
      ).timeout(Duration(seconds: 30));
      print(response);
      responseJson = returnResponse(response);
    }on SocketException {
      throw NoInternetException('No internet connection');
    } on TimeoutException catch (e) {
      throw FetchDataException(e.message ?? 'Request timed out');
    } on FormatException {
      throw FetchDataException('Invalid response format from server');
    }catch (e) {
      throw FetchDataException('Unexpected error: ${e.toString()}');
    }return responseJson;
  }

  @override
  Future getApi(String url)async{
    dynamic responseJson;
    try{
      var response = await http.get(Uri.parse(url)).timeout(
        Duration(seconds: 30),
        onTimeout: () {
          throw TimeoutException('Request timed out after 30 seconds');
        },
      );
      responseJson = returnResponse(response);
    }on SocketException {
      throw NoInternetException('No internet connection');
    } on TimeoutException catch (e) {
      throw FetchDataException(e.message ?? 'Request timed out');
    }on PathNotFoundException catch (e) {
      throw ResourceNotFoundException(e.message);
    } on FormatException {
      throw FetchDataException('Invalid response format from server');
    }
    catch (e) {
      throw FetchDataException('Unexpected error: ${e.toString()}');
    }return responseJson;
  }


  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        return jsonDecode(response.body);
      case 201:
        return jsonDecode(response.body);
      case 204:
        return null;
      case 400:
        throw BadRequestException('Bad Request}');
      case 401:
        throw UnAuthorisedException('Unauthorized');
      case 403:
        throw ForbiddenException('Forbidden');
      case 404:
        throw ResourceNotFoundException('Resource Not Found');
      case 500:
        throw InternalServerException('Internal Server Error');
      case 503:
        throw ServiceUnavailableException('Service Unavailable');
      default:
        throw FetchDataException(
            'Unexpected Error: ${response.statusCode} - ${response.reasonPhrase}');
    }
  }

}