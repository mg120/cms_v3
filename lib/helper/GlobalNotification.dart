import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import 'get_binding.dart';

class GlobalNotification {
  static StreamController<Map<String, dynamic>> _onMessageStreamController =
      StreamController.broadcast();

  late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  static late BuildContext context;
  static GlobalNotification instance = GlobalNotification._();
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  GlobalNotification._();

  setupNotification(BuildContext cxt) async {
    context = cxt;
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()?.requestPermission();

    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/launcher_icon');
    final DarwinInitializationSettings initializationSettingsDarwin =
    DarwinInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    final InitializationSettings initSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsDarwin);
    _flutterLocalNotificationsPlugin.initialize(
      initSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse
    );

    final bool? result = await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );

    NotificationSettings settings = await messaging.requestPermission(provisional: true);
    print('User granted permission: ${settings.authorizationStatus}');
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      messaging.getToken().then((token) {
        print("========>>> push Token is $token");
      });
      messaging.setForegroundNotificationPresentationOptions(
          alert: false, badge: false, sound: false);
      // messaging.getInitialMessage().then((message) => _showLocalNotification(message));
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        log("_____________________Message data:${message.data}");
        _showLocalNotification(message);
        _onMessageStreamController.add(message.data);
      });
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        print('A new onMessageOpenedApp event was published!');
        flutterNotificationClick(json.encode(message.data));
      });
      FirebaseMessaging.onBackgroundMessage(
          _firebaseMessagingBackgroundHandler);
    }
  }

  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    print("Handling a background message: ${message.messageId}");
    flutterNotificationClick(json.encode(message.data));
  }

  StreamController<Map<String, dynamic>> get notificationSubject {
    return _onMessageStreamController;
  }

  void onDidReceiveLocalNotification(int id, String? title, String? body, String? payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    // _showLocalNotification(message);
  }

  void onDidReceiveNotificationResponse(NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
      var _data = json.decode("$payload");
      var _type = _data["type"];
      debugPrint('====>> _type $_type');
    }
    // await Navigator.push(
    //   context,
    //   MaterialPageRoute<void>(builder: (context) => SecondScreen(payload)),
    // );
  }

  _showLocalNotification(RemoteMessage? message) async {
    if (message == null) return;
    String? path;
    BigPictureStyleInformation? bigPictureStyleInformation;
    if (message.notification?.android?.imageUrl != null) {
      path = await _downloadAndSaveFile("${message.notification?.title}");
      bigPictureStyleInformation = BigPictureStyleInformation(
        FilePathAndroidBitmap(path),
        largeIcon: FilePathAndroidBitmap(path),
        contentTitle: "${message.notification?.title}",
        summaryText: "${message.notification?.body}",
      );
    }

    var android = AndroidNotificationDetails(
      "${DateTime.now()}",
      "DEFAULT",
      priority: Priority.high,
      importance: Importance.max,
      playSound: true,
      largeIcon: path != null ? FilePathAndroidBitmap(path) : null,
      shortcutId: DateTime.now().toIso8601String(),
      styleInformation: bigPictureStyleInformation,
    );
    // var ios = IOSNotificationDetails();
    var _platform = NotificationDetails(android: android);
    _flutterLocalNotificationsPlugin.show(
        DateTime.now().microsecond,
        "${message.notification?.title}",
        "${message.notification?.body}",
        _platform,
        payload: json.encode(message.data));
  }

  Future<String> _downloadAndSaveFile(String url) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath =
        '${directory.path}/${directory.path.split("/").last}';
    await Dio().download(url, filePath);
    return filePath;
  }

  static Future flutterNotificationClick(String? payload) async {
    print("tttttttttt $payload");
    var _data = json.decode("$payload");
    var _type = _data["type"];
    print('====>> _type $_type');
    // var orderId = _data["data"]["id"];
    // var order = Order.fromJson(_data["data"]);
    // var isUser = int.parse(_data["sender"])==1;

    // if(_type=="admin_notify"){
    //   Get.offAll(() => const HomeScreen(), binding: GetBinding());
    // }else if(_type=="order"){
    //   print('========>> orrrrrrrder');
    //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsScreen(orderId: orderId,order: order)));
    //   //Get.to(() => DetailsScreen(orderId: orderId,order: order), binding: GetBinding());
    // }
  }
}


//{"body_en":"Order Status changed by provider",
// "title_ar":"طلب رقم #  2406",
// "data":"{\"room_id\":null,\"title\":\"ghjvfu\",\"consult_date\":\"13\\/02\\/2023\",\"duration\":\"10\",\"contact_type\":\"chat\",\"payment_type\":null,\"provider\":{\"image\":\"https:\\/\\/direction.hwzn.sa\\/dashboard\\/assets\\/media\\/avatars\\/300-1.jpg\",\"intrests\":[{\"id\":9,\"category\":{\"image\":\"https:\\/\\/direction.hwzn.sa\\/storage\\/categories\\/zGfi4DmmPQeIHZNqYloSxiVzB9ful7C1oQk1xYuf.png\",\"name\":\"الاحوال الشخصية\",\"id\":1,\"selected\":true,\"desc\":\"الاحوال الشخصية\"}},{\"id\":10,\"category\":{\"image\":\"https:\\/\\/direction.hwzn.sa\\/storage\\/categories\\/kKegMfpGqQwhauXXEWZfXZcUeTzEZw6CQkBLF6oT.png\",\"name\":\"القضاء التجاري\",\"id\":2,\"selected\":true,\"desc\":\"القضاء التجاري\"}}],\"user_type_name\":\"provider\",\"last_name\":\"elsaied\",\"is_not


//{body_en: Cumque repellendus,
// sender_model: Admin,
// title_ar: Ea voluptatem dolor,
// sender: 1,
// body_ar: Molestiae soluta vol,
// title_en: Repudiandae dolore c,
// type: admin_notify}
