import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal
      ),
      home: MainPage(),
    );
  }
}
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 4, vsync:this, initialIndex: 0);
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.red[400]));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: Color.fromARGB(50, 255,255,25),
            borderRadius: BorderRadius.all(Radius.circular(22.0)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search Phone",
                      hintStyle: TextStyle(color: Colors.white),
                      icon: Icon(Icons.search, color: Colors.white,)
                    )
                  ),
                )
              ),
              Expanded(
                flex: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.mic, color: Colors.white,)
                      ),
                      VerticalDivider(color: Colors.white,),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_vert,color: Colors.white,),
                      )


                    ],
                  ),
                ),

              )
            ],
          ),
        ),
          bottom: TabBar(
            controller: controller,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon:Icon(Icons.person_add)),
              Tab(icon: Icon(Icons.notifications)),
              Tab(icon: Icon(Icons.list),)
            ],
          )
      ),
      body: TabBarView(
        controller: controller,
        children: [
          HomePage(),
          HomePage(),
          HomePage(),
          HomePage(),
        ],
      )
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data = ['one', 'two', 'three', 'four', 'five', 'six', 'seven','eight','nine','ten'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
         itemCount: 9,
        itemBuilder: (BuildContext context, int i)  => Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: Text(data[i], style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0))),
                  Divider(color: Colors.black,)
                ],
              )
            )
          ],
        )
      )
    );
  }
}


