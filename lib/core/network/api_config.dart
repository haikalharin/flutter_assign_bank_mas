class ApiConfig {
  ApiConfig._();

  static const token =
      "6369de3d8da8e764cc3c1cbe4121bb6741875de2c30dfd39df8fd351b6a508ea";
  static const String baseUrl = "https://private-16555-erd.apiary-mock.com";
  static const Duration receiveTimeout = Duration(milliseconds: 15000);
  static const Duration connectionTimeout = Duration(milliseconds: 15000);
  static const String users = '/users';
  static const String posts = '/posts';
  static const String comments = '/comments';
  static const String todos = '/todos';
  static const header = {
    // 'Authorization': 'Bearer $token',
    'Content-Type': 'application/json',
  };
}
