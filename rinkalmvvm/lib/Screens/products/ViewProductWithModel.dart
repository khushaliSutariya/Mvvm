import 'package:flutter/material.dart';
import 'package:mvvmproject/providers/ProductProvider.dart';
import 'package:provider/provider.dart';

import 'UpdateProductScreen.dart';

class ViewProductWithModel extends StatefulWidget {
  const ViewProductWithModel({Key? key}) : super(key: key);

  @override
  State<ViewProductWithModel> createState() => _ViewProductWithModelState();
}

class _ViewProductWithModelState extends State<ViewProductWithModel> {
  ProductProvider? provider;

  // demo()
  // {
  //   dsfds
  //   sdfsfd
  //   sdfsdf
  //   throw Exception
  // }
  // try
  // {
  //demo();
  //   var i=10,j=0;
  //   var total = i / j;
  //   print(total);
  // }
  // catch(Exception e)
  // {
  //   print("");
  // }

  getdata() async {
    await provider!.viewproducts();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<ProductProvider>(context, listen: false);
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ProductProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("Product With Model"),
      ),
      body: (provider!.isloading)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: provider!.alldata!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Text(
                            provider!.alldata![index].pname.toString(),
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            provider!.alldata![index].qty.toString(),
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            provider!.alldata![index].price.toString(),
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    var id = provider!.alldata![index].pid
                                        .toString();
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          UpdateProductScreen(updateid: id),
                                    ));
                                  },
                                  child: Text("Update")),
                              SizedBox(
                                width: 20.0,
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
                  ),
                );
              },
            ),
    );
  }
}
