import 'package:flutter/material.dart';
import 'package:crisp/crisp.dart';

class Crisp extends StatefulWidget {
  @override
  _CrispState createState() => _CrispState();
}

class _CrispState extends State<Crisp> {
  @override
  void initState() {
    crisp.initialize(
      websiteId: 'f0ff85ee-b0ef-4186-8290-9d5dbb708553',
    );

    crisp.register(
      CrispUser(
        email: "guptabhoomika2000@gmail.com",
        avatar: 'https://avatars2.githubusercontent.com/u/16270189?s=200&v=4',
        nickname: "Bhoomika",
        phone: "74570303549",
      ),
    );

    crisp.setMessage("How can we help you?");
    print(crisp.user);
    print(crisp.user.email);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CrispView(
        loadingWidget: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
