import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../Models/Product.dart';
import 'FakeProductDetails.dart';

class FakeProductScreen extends StatefulWidget {
  @override
  State<FakeProductScreen> createState() => _FakeProductScreenState();
}

class _FakeProductScreenState extends State<FakeProductScreen> {
  List<Product>? alldata;
  bool isloading = false;

  getdata() async {
    setState(() {
      isloading = true;
    });
    Uri url = Uri.parse("https://api.escuelajs.co/api/v1/products");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body.toString());
      /*
        1. json loop
        2. Json obj read
        3. Json object class(model) object
        4. Model obj list store
        */
      setState(() {
        alldata = json.map<Product>((obj) => Product.fromJson(obj)).toList();
        isloading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: (isloading)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: alldata!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(alldata![index].images![0].toString()),
                  title: Text(alldata![index].title.toString()),
                  trailing: Text(alldata![index].price.toString()),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FakeProductDetails(
                              obj: alldata![index],
                            )));
                  },
                );
              },
            ),
    );
  }
}
