import 'dart:convert';

class ResponseVO {
  ResponseVO(
      {this.success,
        this.timestamp,
        this.data,
        this.status,
        this.errorMessage,
        this.statusCode,
        this.key});

  bool? success;
  String? timestamp;
  String? errorMessage;
  int? status;
  int? statusCode;
  int? key;

  /// 결과 값
  dynamic data;

  dynamic toJson() => {
    'success': success,
    'timestamp': timestamp,
    'data': data,
    'status': status,
    'errorMessage': errorMessage,
    'statusCode': statusCode,
    'key': key,
  };

  factory ResponseVO.fromJson(dynamic json, [int? statusCode]) {
    return json == null || json.runtimeType == String
         ? ResponseVO() : jsonDecode(json) ;
    // return json == null || json.runtimeType == String
    //     ? ResponseVO()
    //     : ResponseVO(
    //     success: json['success'] ?? false,
    //     timestamp: json['timestamp'] ?? '',
    //     data: json['data'] ?? '',
    //     status: json['status'] ?? 500,
    //     errorMessage: json['errorMessage'] ?? '',
    //     statusCode: statusCode,
    //     key: json['key'] ?? 0);
  }
}