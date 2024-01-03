import'package:http/http.dart' as http;

class UserApi {
  final Logger logger;

  UserApi(this.logger);

  void registerUser(String username, String password) {
    logger.log("User registered: $username");
  }
}

abstract interface class Logger{
  void log(String message);
}

class ConsoleLogger implements Logger{
  @override
  void log(String message) {
    print("LOG: $message");
  }
}

class RemoteLogger implements Logger{
  @override
  void log(String message) {
    http.post(Uri.parse("http://api.todo.com/logger"), body: {"message":message});
  }
}

main() {
  final api = UserApi(ConsoleLogger());
  api.registerUser("홍길동", "abc123*");
}
