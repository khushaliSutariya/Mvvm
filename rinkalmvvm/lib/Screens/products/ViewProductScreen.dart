import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'UpdateProductScreen.dart';

class ViewProductScreen extends StatefulWidget {
  const ViewProductScreen({Key? key}) : super(key: key);

  @override
  State<ViewProductScreen> createState() => _ViewProductScreenState();
}

class _ViewProductScreenState extends State<ViewProductScreen> {
  Future<List>? alldata;
  Future<List> getdata() async {
    Uri url = Uri.parse("http://picsyapps.com/studentapi/getProducts.php");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var body = response.body.toString();

      var json = jsonDecode(body);
      return json["data"];
    } else {
      print("Error");
      return [];
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      alldata = getdata();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "View Product",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: FutureBuilder(
        future: alldata,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.length == 0) {
              return Text("No Data Found");
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    margin: EdgeInsets.all(20.0),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Name: " +
                                      snapshot.data![index]["pname"]
                                          .toString()),
                                  Text("Price: " +
                                      snapshot.data![index]["price"]
                                          .toString()),
                                  Text("Quantity: " +
                                      snapshot.data![index]["qty"].toString()),
                                ],
                              ),
                              Text(snapshot.data![index]["added_datetime"]
                                  .toString()),
                            ],
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    var id =
                                        snapshot.data![index]["pid"].toString();
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          UpdateProductScreen(updateid: id),
                                    ));
                                  },
                                  child: Text("Update")),
                              SizedBox(
                                width: 25.0,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text("Delete Product"),
                                            content: Text(
                                                "Are you sure delete this product?"),
                                            actions: <Widget>[
                                              ElevatedButton(
                                                child: Text("Yes"),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              SizedBox(
                                                width: 5.0,
                                              ),
                                              ElevatedButton(
                                                child: Text("No"),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              )
                                            ],
                                          );
                                        });
                                  },
                                  child: Text("Delete"))
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
