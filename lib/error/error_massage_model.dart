class ErrorMessageModel{
  final String status;
  final String message;

  ErrorMessageModel({required this.status, required this.message});
  factory ErrorMessageModel.fromJson(Map<String,dynamic> json){
    return ErrorMessageModel(status: json['status'], message: json['message']);
  }
}