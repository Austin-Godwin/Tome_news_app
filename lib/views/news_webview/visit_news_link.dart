import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VisitNewsLink extends StatefulWidget {
  final String newsLink;
  const VisitNewsLink({Key? key, required this.newsLink}) : super(key: key);

  @override
  State<VisitNewsLink> createState() => _VisitNewsLinkState();
}

class _VisitNewsLinkState extends State<VisitNewsLink> {
  late WebViewController controller;
  var loadingPercentage = 0;
  bool isLoading = true;
  @override
  void initState() {
    // This Enables Virtual display of the webview
    if (Platform.isAndroid) {
      WebView.platform = AndroidWebView();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            WillPopScope(
              onWillPop: () async {
                if (await controller.canGoBack()) {
                  controller.goBack();
                  return false;
                } else {
                  return true;
                }
              },
              child: WebView(
                initialUrl: widget.newsLink,
                onPageStarted: (url) {
                  setState(() {
                    loadingPercentage = 0;
                  });
                },
                onProgress: (progress) {
                  setState(() {
                    loadingPercentage = progress;
                  });
                },
                onPageFinished: (url) {
                  setState(() {
                    loadingPercentage = 100;
                  });
                },
                onWebViewCreated: (controller) {
                  this.controller = controller;
                },
                javascriptMode: JavascriptMode.unrestricted,
                gestureNavigationEnabled: true,
              ),
            ),
            if (loadingPercentage < 100)
              LinearProgressIndicator(
                value: loadingPercentage / 100.0,
                color: Colors.red,
                backgroundColor: Colors.red.shade100,
              )
          ],
        ),
      ),
    );
  }
}
