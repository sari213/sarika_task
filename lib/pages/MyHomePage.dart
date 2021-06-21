import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:task/models/crypro.dart';
import 'dart:convert' as convert;

import 'package:task/pages/details.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
List<Data> list=new List<Data>.filled(0, Data(),growable: true);
@override
void initState() {
    // TODO: implement initState
  get_list();
    super.initState();
  }
get_list()async{
final response = await http.get(Uri.parse('https://pro-api.coinmarketcap.com/v1/cryptocurrency/map?CMC_PRO_API_KEY=2592e201-7cb0-41b4-81d5-abacc60ac4ee'));
if (response.statusCode==200){
  Cryptocurrencies cryptocurrencies = Cryptocurrencies.fromJson(convert.jsonDecode(response.body));
  setState(() {
    list = cryptocurrencies.data!;
  });
}else {
  // If the server did not return a 200 OK response,
  // then throw an exception.
  throw Exception('Failed to load album');
}
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Cryptocurrencies "),
        ),
        body: ListView.builder (
            padding: const EdgeInsets.all(0),
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  leading: Text('${list[index].name}',style: TextStyle(
                    fontSize: 16
                  ),),
                  title: Text('${list[index].symbol}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => details(crypt: list[index]),
                      ),
                    );
                  },

                ),
              );
            }
        )
      ),
    );
  }
}
