import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get filename {
    return '.env';
  }

  static String get baseApiUrl {
    return dotenv.env['BASE_API_URL'] ?? '';
  }

  static String get accessToken {
    return dotenv.env['ACCESS_TOKEN'] ?? '';
  }
}
