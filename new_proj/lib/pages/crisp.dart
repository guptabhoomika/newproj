import 'package:flutter/material.dart';
import 'package:crisp/crisp.dart';
class Crisp extends StatefulWidget {
  @override
  _CrispState createState() => _CrispState();
}

class _CrispState extends State<Crisp> {
  @override
  void initState() {
    // TODO: implement initState
    print("In initstate");
        crisp.initialize(
      websiteId: '00104658-ccb8-432e-9d75-9511b5a7576',
     
    );

    crisp.register(
      CrispUser(
        email: "guptabhoomika2000@gmail.com",
        avatar: 'https://avatars2.githubusercontent.com/u/16270189?s=200&v=4',
        nickname: "Bhoomika",
        phone: "74570303549",
      ),
    );

    crisp.setMessage("Hello world - initial message");
    print(crisp.user);
    print(crisp.user.email);
    
 
    super.initState();
  }
  @override
 Widget build(BuildContext context) {
    return Scaffold(
     body: 
        Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text(crisp.user.email),
             ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(crisp.user.phone),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(crisp.user.nickname),
            ),
        
             

           ],
       
     ),
        )
      
    );
  }
}