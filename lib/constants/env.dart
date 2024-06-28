import 'package:flutter_dotenv/flutter_dotenv.dart';

String iosApiKey = dotenv.env['IOS_API_KEY']!;
String androidApiKey = dotenv.env['ANDROID_API_KEY']!;
String iosAppId = dotenv.env['IOS_APP_ID']!;
String androidAppId = dotenv.env['ANDROID_APP_ID']!;
String msgSenderId = dotenv.env['MESSAGING_SENDER_ID']!;
String projectId = dotenv.env['PROJECT_ID']!;
String dbUrl = dotenv.env['DB_URL']!;
String storageBucket = dotenv.env['STORAGE_BUCKET']!;
String iosBundleId = dotenv.env['IOS_BUNDLE_ID']!;
