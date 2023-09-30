import 'package:flutter/material.dart';
import 'package:frontend/ui/auth/auth.dart';
import 'package:frontend/ui/dashboard/dashboard.dart';

class AppleDoorConfig {

  static Map<String, Widget Function(BuildContext)> getRoutes(BuildContext context) {
    return {
      "/auth" : (context) => const Auth(),
      "/home" : (context) => const Dashboard(),

    };
  }

}