import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


import 'package:dio/dio.dart';

import 'package:flutter_projects/data_model.dart' as d;


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home:  const Data(), /// My Class
    );
  }
}

class Data extends StatefulWidget {
  const Data({Key? key}) : super(key: key);


  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {  /// what is this <Data>??

  List<d.Data>? list;

  void getHttp() async {
    try {
      var response =
        await Dio().get('http://localhost:22420/api/Book/GetBooks');

       /// await Dio().get('http://127.0.0.1:22420/api/Book/GetBooks');

        var statusCode =  response.statusCode;

        print(statusCode);

        list = List<d.Data>.from(response.data.map((p) => d.Data.fromJson(p)));
        setState(() {

        });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }


  @override
  Widget build(BuildContext context) {

    getHttp();



    return ListView.builder(
        padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
        shrinkWrap: true,
        itemCount: list?.length,
        itemBuilder: (_, index) {
          return  index == 0
              ? Card(

            child: Row(
              children: const [

               Expanded(child: Text("bookId")),
               Expanded(child: Text("bookName")),
               Expanded(child: Text("categoryId")),
               Expanded(child: Text("category")),
               Expanded(child: Text("publisherId")),
               Expanded(child: Text("publisher")),
               Expanded(child: Text("authorId")),
               Expanded(child: Text("author")),
               Expanded(child: Text("description")),
               Expanded(child: Text("edition")),
               Expanded(child: Text("price")),
               Expanded(child: Text("isActive")),

              ],
            ),
          )
              : Card(
            child: Row(
              children: [

                    /*"bookId"
                    "bookName"
                    "categoryId"
                    "category"
                    "publisherId"
                    "publisher"
                    "authorId"
                    "author"
                    "description"
                    "edition"
                    "price"
                    "isActive"*/

                Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(list![index - 1].bookId.toString()),
                )),
                Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(list![index - 1].bookName.toString()),
                    )),
                Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(list![index - 1].categoryId.toString()),
                    )),
                Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(list![index - 1].category.toString()),
                    )),
                Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(list![index - 1].publisherId.toString()),
                    )),
                Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(list![index - 1].publisher.toString()),
                    )),
                Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(list![index - 1].authorId.toString()),
                    )),
                Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(list![index - 1].author.toString()),
                    )),
                Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(list![index - 1].description.toString()),
                    )),
                Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(list![index - 1].edition.toString()),
                    )),
                Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(list![index - 1].price.toString()),
                    )),
                Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(list![index - 1].isActive.toString()),
                    )),

              ],
            ),
          );
        },

    );
  }
}
