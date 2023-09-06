import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:front_delivery/app/core/config/env/env.dart';

class CustomDio extends DioForNative {
  CustomDio()
      : super(
          BaseOptions(
              baseUrl: Env.instanceEnv["backend_base_url"] ?? "",
              connectTimeout: 5000, ///Tempo de execução, se nao retornar em 5s ele da uma exception
              receiveTimeout: 60000), /// Se nao receber a resposta em 60s da uma exception
        ) {
    interceptors.add(
      LogInterceptor(
          requestBody: true, responseBody: true, requestHeader: true),
    );
  }

  ///Conexão com authenticação
  CustomDio auth() {
    return this;
  }

  ///Conexão sem authenticação
  CustomDio unAuth() {
    return this;
  }
}



///Http config
// class httpClient extends IClientHttp {
//   httpClient(this._secureStorageService);
//   final ILocalDataSource _secureStorageService;
//   final client = http.Client();


//   @override
//   Future get(RequestDataUtils requestDataUtils) async {
//     try {
//       String? token = await _secureStorageService
//           .fetchDataFromLocal(RequestDataUtils(key: requestDataUtils.key));

//       var response = await client.get(
//         Uri.parse(requestDataUtils.endPoint! +
//             (requestDataUtils.queryParameters ?? '')),
//         headers: requestDataUtils.needsToken!
//             ? {'Authorization': 'Bearer $token'}
//             : null,
//       );
//       final decode = jsonDecode(response.body);
//       return decode;
//     } on http.Response catch (e) {
//       throw HttpExceptions.triggerException(e.statusCode);
//     }
//   }

//   @override
//   Future post(RequestDataUtils requestDataUtils) async {
//     String? token = await _secureStorageService
//         .fetchDataFromLocal(RequestDataUtils(key: requestDataUtils.key));
//     http.Response response = await http.post(
//       Uri.parse(
//         requestDataUtils.endPoint!,
//       ),
//       body: json.encode(requestDataUtils.data),
//       headers: requestDataUtils.needsToken!
//           ? {
//               "Content-Type": "application/json",
//               "Authorization": "Bearer $token",
//             }
//           : {'Content-Type': 'application/json'},
//     );
    
//     if (response.bodyBytes.isEmpty && response.statusCode == 200) {
//       return;
//     }
//     final decode = jsonDecode(response.body);
//     if (response.statusCode == 200) {
//       return decode;
//     } else {
//       // log('Error on HTTP post: ', error: '${response.statusCode} - ${decode["message"]}');
//       throw HttpExceptions.triggerException(
//           response.statusCode, decode["message"]);
//     }
//   }

//   @override
//   Future delete(RequestDataUtils requestDataUtils) async {
//     String? token = await _secureStorageService
//         .fetchDataFromLocal(RequestDataUtils(key: requestDataUtils.key));

//     var response = await client.delete(
//       Uri.parse(
//         requestDataUtils.endPoint!,
//       ),
//       body: json.encode(requestDataUtils.data),
//       headers: requestDataUtils.needsToken!
//           ? {
//               'Authorization': 'Bearer $token',
//               'Content-Type': 'application/json'
//             }
//           : null,
//     );
//     if (response.statusCode == 200 && response.body.isNotEmpty) {
//       final decode = jsonDecode(response.body);
//       return decode;
//     } else if (response.statusCode == 200 && response.body.isEmpty) {
//       return response.statusCode;
//     } else {
//       throw HttpExceptions.triggerException(response.statusCode);
//     }
//   }

//   @override
//   Future put(RequestDataUtils requestDataUtils) async {
//     String? token = await _secureStorageService
//         .fetchDataFromLocal(RequestDataUtils(key: requestDataUtils.key));

//     http.Response response = await client.put(
//       Uri.parse(
//         requestDataUtils.endPoint!,
//       ),
//       body: json.encode(requestDataUtils.data),
//       headers: requestDataUtils.needsToken!
//           ? {
//               'Authorization': 'Bearer $token',
//               'Content-Type': 'application/json'
//             }
//           : null,
//     );
//     if (response.statusCode == 200 && response.body.isNotEmpty) {
//       final decode = jsonDecode(response.body);
//       return decode;
//     } else if (response.statusCode == 200 && response.body.isEmpty) {
//       return response.statusCode;
//     } else {
//       throw HttpExceptions.triggerException(response.statusCode);
//     }
//   }

//   @override
//   Future patch(RequestDataUtils requestDataUtils) {
//     throw UnimplementedError();
//   }

//   @override
//   Future putData(RequestDataUtils requestDataUtils) async {
//     String? token = await _secureStorageService
//         .fetchDataFromLocal(RequestDataUtils(key: requestDataUtils.key));

//     final response = await client.putUri(
//       Uri.parse(requestDataUtils.endPoint!),
//       data: requestDataUtils.data,
//       options: Options(
//         headers: requestDataUtils.needsToken!
//             ? {
//                 'Authorization': 'Bearer $token',
//                 'Content-Type': 'application/json'
//               }
//             : null,
//       ),
//     );

//     if (response.statusCode == 200 && response.data.isNotEmpty) {
//       final decode = response.data;
//       return decode;
//     } else if (response.statusCode == 200 && response.data.isEmpty) {
//       return response.statusCode;
//     } else {
//       throw HttpExceptions.triggerException(response.statusCode);
//     }
//   }
// }
