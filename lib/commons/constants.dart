
import 'package:flutter_dotenv/flutter_dotenv.dart';

class APIS {
  static String get apiBaseUrl => dotenv.env['API_BASE_URL'] ?? '';
  static String get signin =>  '$apiBaseUrl/mobile/auth/login';
  static String get signOut => '$apiBaseUrl/mobile/auth/logout';
}