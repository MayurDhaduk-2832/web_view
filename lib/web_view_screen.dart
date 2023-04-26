import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewScreen extends StatefulWidget {
  final String name;
  final String url;

  const WebViewScreen(this.name, this.url, {super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late InAppWebViewController _controller;
  PullToRefreshController? pullToRefreshController;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    pullToRefreshController = PullToRefreshController(
      onRefresh: () {
        _controller.reload();
      },
    );
  }

  Future<bool> backButton() async {
    if (await _controller.canGoBack()) {
      _controller.goBack();
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Stack(
        children: [
          WillPopScope(
            onWillPop: backButton,
            child: InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
              initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
                  javaScriptEnabled: true,
                ),
              ),
              onWebViewCreated: (controller) {
                _controller = controller;
              },
              onLoadStart: (controller, url) {
                setState(
                  () {
                    isLoading = true;
                  },
                );
              },
              onLoadStop: (controller, url) {
                setState(
                  () {
                    isLoading = false;
                    pullToRefreshController?.endRefreshing();
                  },
                );
              },
              pullToRefreshController: pullToRefreshController,
            ),
          ),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            )
        ],
      ),
    );
  }
}
