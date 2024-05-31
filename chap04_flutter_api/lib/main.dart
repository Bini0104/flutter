import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HttpApp(),
    );
  }
}

class HttpApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HttpApp();
}

class _HttpApp extends State<HttpApp> {
  String result = "";
  List? data;
  TextEditingController? _editingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = new List.empty(growable: true);
    _editingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _editingController,
          style: TextStyle(color: Colors.black87),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(hintText: '검색어를 입력해주세요'),
        ),
      ),
      body: Container(
        child: Center(
          child: data!.length == 0
              ? Text(
                  '데이터가 없습니다.',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                        child: Container(
                      child: Column(
                        children: <Widget>[
                          Text(data![index]['title'].toString()),
                          Text(data![index]['authors'].toString()),
                          Text(data![index]['sale_price'].toString()),
                          Text(data![index]['status'].toString()),
                          Image.network(
                            data![index]['thumbnail'],
                            height: 100,
                            width: 100,
                            fit: BoxFit.contain,
                          )
                        ],
                      ),
                    ));
                  },
                  itemCount: data!.length,
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          data!.clear();
          getJSONData();
        },
        child: Icon(Icons.file_download),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url =
        'https://dapi.kakao.com/v3/search/book?target=title&query=${_editingController!.value.text}';
    var response = await http.get(Uri.parse(url),
        headers: {"Authorization": "KakaoAK bde5c65cd4ef73080a6bf4c98b7ab140"});
    print(response.body);

    setState(() {
      var dataConvertedToJSON = json.decode(response.body);
      List result = dataConvertedToJSON['documents'];
      data!.addAll(result);
    });

    return response.body;
  }
}
