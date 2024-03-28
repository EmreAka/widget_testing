import 'dart:developer';

class MockService {
  void send(String name, String password) {
    log("Name: $name, Password: $password");
  }
}