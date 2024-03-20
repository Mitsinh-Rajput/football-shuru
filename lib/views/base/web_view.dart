import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class CustomWebView extends StatefulWidget {
  final String url, title;

  const CustomWebView({super.key, required this.url, required this.title});

  @override
  State<CustomWebView> createState() => _CustomWebViewState();
}

class _CustomWebViewState extends State<CustomWebView> {
  late String url;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    url = widget.url;
    if (!(url.startsWith('http'))) {
      if (!(url.startsWith('https://'))) {
        url = 'https://$url';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    log(url);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
        ),
      ),
      body: Stack(
        children: [
          if (isLoading)
            const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          InAppWebView(
            onLoadStop: (controller, url) {
              setState(() {
                isLoading = false;
              });
            },
            initialUrlRequest: URLRequest(url: WebUri(url)),
            onReceivedServerTrustAuthRequest: (controller, challenge) async {
              return ServerTrustAuthResponse(action: ServerTrustAuthResponseAction.PROCEED);
            },
          ),
        ],
      ),
    );
  }
}
