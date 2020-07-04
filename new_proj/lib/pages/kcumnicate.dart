import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kommunicate_flutter_plugin/kommunicate_flutter_plugin.dart';

class Kcomm extends StatefulWidget {
  @override
  _KcommState createState() => _KcommState();
}

class _KcommState extends State<Kcomm> {
  bool showLoader = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Do you want to chat with us?",
                  style: TextStyle(fontSize: 35),
                  textAlign: TextAlign.center,
                ),
              ),
              RaisedButton(
                child: Text("Click Here"),
                onPressed: () async {
                  setState(() {
                    showLoader = true;
                  });
                  try {
                    dynamic conversationObject = {
                      'appId': '3ee0d8fb8677a5f3f8fc76529452278af',
                      'withPreChat': true
                    };
                    dynamic result =
                        await KommunicateFlutterPlugin.buildConversation(
                            conversationObject);
                    setState(() {
                      showLoader = false;
                    });
                    print(
                        "Conversation builder success : " + result.toString());
                  } on Exception catch (e) {
                    print("Conversation builder error occurred : " +
                        e.toString());
                  }
                },
              ),
            ],
          ),
          (showLoader)
              ? Center(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: CircularProgressIndicator(),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
