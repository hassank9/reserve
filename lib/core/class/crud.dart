import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:path/path.dart';
import '../functions/chackinternet.dart';
import 'statusrequest.dart';
import 'package:http/http.dart' as http;


class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    if (await checkInternet()) {
      var response = await http.post(Uri.parse(linkurl) , headers: {'Content-Type': 'application/json'} ,body: json.encode(data));
      print(response.statusCode) ;

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        print(responsebody) ;
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }

  }


  Future<Either<StatusRequest, Map>> getData(String linkurl) async {
    if (await checkInternet()) {
      var response = await http.get(Uri.parse(linkurl));
      print(response.body) ;
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        print(responsebody) ;
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }

  }



  Future<Either<StatusRequest, Map>> deleteData(String linkurl, Map data) async {
    if (await checkInternet()) {
      var response = await http.delete(Uri.parse(linkurl) , headers: {'Content-Type': 'application/json'} ,body: json.encode(data));
      print(response.statusCode) ;

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        print(responsebody) ;
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }

  }

}
