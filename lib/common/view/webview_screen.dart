import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  WebViewController? _webViewController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)?.settings.arguments;
    if(_webViewController == null) {
      Uri _url = Uri.parse(
        'https://www.pharma-bros.com/terms',
      );

      if(arguments.toString() != '이용약관') {
        _url = Uri.parse(
          'https://www.pharma-bros.com/privacy',
        );
      }

      _webViewController = WebViewController();
      _webViewController
        ?..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              debugPrint('progressing $progress');
            },
            onPageStarted: (String url) {
              debugPrint(url);
            },
            onPageFinished: (String url) {
              debugPrint('Page Finished');
            },
            onWebResourceError: (WebResourceError error) {},
          ),
        )
        ..loadRequest(_url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebViewWidget(
        controller: _webViewController!,
      ),
    );
  }
}
