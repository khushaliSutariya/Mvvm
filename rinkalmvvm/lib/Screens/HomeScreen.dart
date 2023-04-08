import 'package:flutter/material.dart';
import 'package:mvvmproject/Screens/products/ViewProductWithModel.dart';

import 'products/AddProductScreen.dart';
import 'products/ViewProductScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Screen",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("Add Product"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddProductScreen()));
              },
            ),
            ListTile(
              title: Text("View Product"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ViewProductScreen()));
              },
            ),
            ListTile(
              title: Text("View Product With Model"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ViewProductWithModel()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
