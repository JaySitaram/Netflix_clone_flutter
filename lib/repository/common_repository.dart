import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

abstract class CommonRepository{
  getApi(String url);
  postApi(String url,Map<String,String> map);
}

class ApiRepository extends CommonRepository{
  @override
  getApi(String url,{Map<String,String>? map}) async{
    try{
       var response=await http.get(Uri.parse(url),headers: map);
       if(response.statusCode==200){
         return json.decode(response.body);
       }
       else{
          throw CustomException(json.decode(response.body));
       }
    }
    on SocketException catch(e){}
    on FormatException catch(e){}
    on CustomException catch(e){} 
  }

  @override
  postApi(String url,Map<String,String>? map,{Map<String,String>? bodyMap}) async{
     try{
       var response=await http.post(Uri.parse(url),headers: map,body: bodyMap);
        if(response.statusCode==200){
         return json.decode(response.body);
       }
       else{
          throw CustomException(json.decode(response.body));
       }
     }
     on SocketException catch(e){}
     on FormatException catch(e){}
     on CustomException catch(e){}
  }
}

class CustomException implements Exception{
  dynamic cause;
  CustomException(this.cause);
}