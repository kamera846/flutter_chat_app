import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;

class PushNotificationService {
  static Future<String> getAccessToken() async {
    final serviceAccountJson = {
      "type": "service_account",
      "project_id": "my-testing-project-17d76",
      "private_key_id": "0a3678289796c11047d12543002ad5cf36fc069f",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDNSRcGSL6y6WzU\nVMdwr6ITN/0sfkD6/UxJA3jYPrJxf4v4PY2pwZSrNO5a7UdKjK1v+yWgKD7q3jnX\nN/ttuw4Q69yFmqk9AVKJaKZS5T8OL2YcVCKXd/n4x8lx2bzOaqeliHDf1qXGxpPG\n+lmAAjknAT1BKEzyfqYXJGT6L8GWCUECVkSBbGeEp/YJg1Z8vjfVB/oUwcf+Y/DU\nvmkPABst1ST83ImbYSgcXo8klzNya43HDdWanmN4SwzMqeHJ76Do2WLJMsrxljG1\nnW716SpyUfEYGPWzy4geB+Xm3VwsPagivmNP+I2u7eLpGwq0X+V2nEogBP0gwmIc\na2e5G+t1AgMBAAECggEAD+0uPJ4TMXU7rMOBD6SIqf4LhdKrvu086GM9EmXW2Uhg\ndxtrbLKokpnSLjq/b7C3Wfs9oY3Nx9IC4cglmQ9MmZJ68uCbZbC/EwsL8F15xWN3\nBBag8mhr+9mgLtWKOOd8ZzLNMwiHpwLL/0F4BR7nCTgm5PG3+o5J23zG2sQuvDGL\nBRGBDnoixgkWGEh0xHackamlqveaStdodH8PXb0y+1rkNANiwUhLEXwP1If6q13Q\nlXNMmbGNJK4JeefmJm9h6yXxOi01WkVnUMOZ2BynmVn0lnJn6cFg3zflo1PALp/y\nYjQhLlQHun/0ROyuygiVid8C64ij/5B3SRvwEjIXwQKBgQDrDcVZs/R9yQVIutSX\nRLT0sfVx599rTY6BdXEhdkZafqZbWlGRVdjcSOPaGdR2SHAjCeB1pfdDt8izP1Ds\nffXrrE/uMA+KF2vFg0u/8SGpPVbeInb0M7zUmJc8lPPzDUBw+pKW5fJGwnQu5CQd\n5b/deLvrfF8u8xNLx73oIzqGlQKBgQDflDjMy6Vqff1zKSUQlku4sDcYCsjFi6p/\nXOjXE5L5BbBbrWN7jGV2ToamNaR+gyaxyxrLH8Tp6ssYriGL0uJadJuP7oh0G87b\nwwBdSpahWsPYGzgAvKNM2sStFbmai4KW/SWpZgLZtwu6KwfoNueMaX7A18f3M+Dw\nvcufjOj5YQKBgHSYnyWRE511os5iBuSGa3DZ+dOn3na+wQrMs/KSVfG700+LbNy4\nBdu3uHbOy0plQmLPGm2hhxcrSj5IER9OmDdwgTG422x3k7klGOU8eqMVz0pfNDyM\nkYWvr42Yoa4WC7o/QYnixJx/BtzfxF6kQdldc3IrfpeucgrsKPLGzthFAoGBALxS\nOy21cxWqHev8gi3gitN8CkwD+Wz74Zb6CV3wLOH4er4d5CfS8DuglSY3FOFDUzp6\n24ywq8pkbMHTGoqODP8oLUglIWa7bZgKPqpWA17R9xh2hMuKGPrJYtRv8jBMxqir\nfiebt1bvKb+cM0LTzGGnEo8YsmR0nEnrdDJmHG7BAoGBAIqCXDEQ7qqOgIIVyGoR\nKYhe7HEGAZIjr+2pbftZFuXC2ttnvLMPF2RrBzavcQTjHpJsg1URU68gbmm8hvgD\npYdtOzWQkBGHTAQ2DWuW5kdZM9vdiRxi6kfCZozpajOlp8xVb0kCa+PLB3M1ULRb\nUCMlMA7TyIZbEZYQShVYU5j2\n-----END PRIVATE KEY-----\n",
      "client_email":
          "flutter-chat-app@my-testing-project-17d76.iam.gserviceaccount.com",
      "client_id": "114747014822960863993",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/flutter-chat-app%40my-testing-project-17d76.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    };

    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging",
    ];

    final client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
    );

    // get access token
    final credentials = await auth.obtainAccessCredentialsViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
      client,
    );

    client.close();

    return credentials.accessToken.data;
  }

  static sendNotificationToSelectedDriver(
      String deviceToken, BuildContext context) async {
    final String serverKey = await getAccessToken();
    String endpointFirebaseCloudMessaging =
        'https://fcm.googleapis.com/v1/projects/my-testing-project-17d76/messages:send';

    final Map<String, dynamic> message = {
      'message': {
        'token': deviceToken,
        'notification': {
          'title': 'Http Push Notification',
          'body': 'Test push fcm notification using http'
        },
      }
    };

    final response = await http.post(
      Uri.parse(endpointFirebaseCloudMessaging),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $serverKey',
      },
      body: jsonEncode(message),
    );

    if (response.statusCode == 200) {
      print('Notification sent successfully.');
    } else {
      print('Failed, Notification not sent with code: ${response.statusCode}');
    }
  }
}
