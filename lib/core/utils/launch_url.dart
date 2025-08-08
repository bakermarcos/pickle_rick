import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LaunchUrl {
  static void openUrl(String url, {String? msg, LaunchMode? mode}) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: mode ?? LaunchMode.platformDefault);
    } else {
      Fluttertoast.showToast(
        fontSize: 16.0,
        textColor: Colors.white,
        backgroundColor: Colors.red,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
        msg: msg ?? 'Não foi possível abrir a url: $url',
      );
    }
  }
}
