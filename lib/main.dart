import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MaterialApp(home: webapp()));

class webapp extends StatefulWidget {
  @override
  _webappState createState() => _webappState();
}

class _webappState extends State<webapp> {
  final Completer<WebViewController> _controller =
      new Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[600],
          title: Text(
            "Task 2 (Hassan Teslim)",
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[FutureBuilder<WebViewController>(
              future: _controller.future,
              builder: (BuildContext context,
                  AsyncSnapshot<WebViewController> controller) {
                if (controller.hasData) { return
                  Container(
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.school),
                          onPressed: () {controller.data.loadUrl("https://unaab.edu.ng/");},
                          color: Colors.white,
                        ),
                        Center(
                            child: GestureDetector(
                                child: Text("Funnab Home",
                                    style: TextStyle(color: Colors.white)),
                                onTap: () {controller.data.loadUrl("https://unaab.edu.ng/");}))
                      ],
                    ),

                  );
                }
                return Container();
              })


          ],
        ),
        body: WebView(
          initialUrl: "https://unaab.edu.ng/",
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ),
        floatingActionButton: FutureBuilder<WebViewController>(
            future: _controller.future,
            builder: (BuildContext context,
                AsyncSnapshot<WebViewController> controller) {
              if (controller.hasData) {
                return FloatingActionButton.extended(
                    backgroundColor: Colors.red,
                    onPressed: (){ controller.data.loadUrl("https://www.youtube.com/");},
                    icon: Icon(
                      Icons.video_library,
                      color: Colors.white,
                    ),
                    label: Text("Go to YouTube"));
              } else{
                return FloatingActionButton.extended(
                    backgroundColor: Colors.red,
                    onPressed: (){ controller.data.loadUrl("https://www.youtube.com/");},
                    icon: Icon(
                      Icons.video_library,
                      color: Colors.white,
                    ),
                    label: Text("Go to YouTube"));
              }
            }));
  }
}
