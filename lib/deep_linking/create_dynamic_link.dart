import 'package:dynamic_link_app/home_page_details.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class FireBaseDeepLink {
  static void createDynamicLink({
    required String id,
    required String title,
    String? image,
    String? description,
  }) async {
    String url = 'https://testtestlink.page.link';
    String content = 'https://testtestlink.page.link/start?id=$id';
    final DynamicLinkParameters dynamicLinkParams = DynamicLinkParameters(
      uriPrefix: url,
      link: Uri.parse(content),
      androidParameters: const AndroidParameters(
        packageName: "com.example.dynamic_link_app",
        minimumVersion: 0,
      ),
      iosParameters: const IOSParameters(
        bundleId: "com.example.dynamicLinkApp",
        appStoreId: "123456789",
        minimumVersion: '0',
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
        description: description,
        imageUrl: Uri.parse('$image'),
        title: title,
      ),
    );
    print("uri ${Uri.parse(content)}");
    final dynamicLink = await FirebaseDynamicLinks.instance.buildShortLink(
      dynamicLinkParams,
      shortLinkType: ShortDynamicLinkType.unguessable,
    );

    await Share.share(
      dynamicLink.shortUrl.toString(),
      subject: title,
    );

    print(" share done");
  }

  static Future<void> initDynamicLinks(BuildContext context) async {
    final uri = await FirebaseDynamicLinks.instance.getInitialLink();
    if (uri != null) {
      handelUri(uri.link, context);
    }

    FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
    dynamicLinks.onLink.listen((dynamicLinkData) async {
      final Uri uri = dynamicLinkData.link;
      print("url  rtl=========   ${dynamicLinkData.link.toString()}");
      handelUri(uri, context);
    }).onError((error) {
      print('onLink error');
    });
  }
}

void handelUri(Uri uri, BuildContext context) async {
  final queryParams = uri.queryParameters;

  if (queryParams.isNotEmpty) {
    String? id = queryParams["id"];
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return HomePageDetails(
          id: id ?? '',
        );
      },
    ));
  }
}
