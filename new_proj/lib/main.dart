import 'package:flutter/material.dart';
import 'package:new_proj/pages/crisp.dart';
import 'package:new_proj/pages/intercom.dart';
import 'package:new_proj/pages/kcumnicate.dart';
import 'package:new_proj/pages/zoom.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
     _pageController = PageController();
    super.initState();
  }
  int pageIndex = 0;
  onPageCahnged(int index)
{
  setState(() {
    pageIndex = index;
  });
}
ontap(int index)
{
  _pageController.animateToPage(
    index,
    duration: Duration(milliseconds: 300),
    curve: Curves.easeInOut
    );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Zoom(),
          Intercom(),
          Crisp(),
          Kcomm()
        ],
        controller: _pageController,
        onPageChanged: onPageCahnged,
        physics: NeverScrollableScrollPhysics(),

      ),
         bottomNavigationBar: BottomNavigationBar(
         type: BottomNavigationBarType.fixed,
    
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.phone,color: Colors.grey,),
            title: Text('Zoom',style: TextStyle(color: Colors.grey),)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit,color: Colors.grey),
            title: Text('Intercom',style: TextStyle(color: Colors.grey))
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings,color: Colors.grey),
            title: Text('Crisp',style: TextStyle(color: Colors.grey))
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.blur_circular,color: Colors.grey),
            title:  Text('Kcommunicate',style: TextStyle(color: Colors.grey))
          )
        ],
        currentIndex: pageIndex,
        onTap: ontap,
      ) ,
      
    );
  }
}