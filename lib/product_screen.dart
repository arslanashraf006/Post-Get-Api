import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/ProductsModel.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Future<ProductsModel> getProductApi() async {
    final response = await http.get(Uri.parse('https://webhook.site/faade9e5-845d-472a-9f3b-ce876a11e075'));
    var data = json.decode(response.body);
    if(response.statusCode==200){
      return ProductsModel.fromJson(data);
    }
    else{
      return ProductsModel.fromJson(data);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    getProductApi();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Api Course'),
      ),
      body: Column(
        children: [
          Expanded(child: FutureBuilder<ProductsModel>(
            future: getProductApi(),
            builder: (context, snapshot) {
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data!.data!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: double.infinity,
                          child: ListView.builder(
                            itemCount: snapshot.data!.data![index].products!.length,
                            itemBuilder: (context, position) {
                              return Container(
                                height: MediaQuery.of(context).size.height * 0.25,
                                width: double.infinity,
                                child: ListView.builder(
                                  itemCount: snapshot.data!.data![index].products![position].images!.length,
                                  itemBuilder: (context, pos) {
                                  return Container(
                                    height: MediaQuery.of(context).size.height * 0.25,
                                    width: double.infinity,
                                    child: Column(
                                      children: [
                                        Text(snapshot.data!.data![index].products![position].salePercent.toString()),
                                        Text(snapshot.data!.data![index].products![position].images![pos].filename.toString()),
                                      ],
                                    ),
                                    // decoration: BoxDecoration(
                                    //   image: DecorationImage(
                                    //     image: NetworkImage(snapshot.data!.data![index].products![position].images![pos].url.toString(),
                                    //     ),
                                    //   ),
                                    // ),
                                  );
                                },),
                              );
                          },),
                        ),
                      ],
                    );
                  },);
              }
              else{
                return Center(child: Text('Loading'),);
              }
          },))
        ],
      ),
    );
  }
}
