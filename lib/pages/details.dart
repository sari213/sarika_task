import 'package:flutter/material.dart';
import 'package:task/models/crypro.dart';

class details extends StatefulWidget {
  Data crypt;
   details({Key? key, required this.crypt}) : super(key: key);

  @override
  _detailsState createState() => _detailsState();
}

class _detailsState extends State<details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.crypt.name.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(

          child: Column(
            children: [
              Text('ID - ${widget.crypt.id.toString()}'),
              Divider(thickness: 1),
              Text('SLUG - ${widget.crypt.slug.toString()}'),
              Divider(thickness: 1),
              Text('SYMBOL - ${widget.crypt.symbol.toString()}'),
              Divider(thickness: 1),
              Text('RANK - ${widget.crypt.rank.toString()}'),
              Divider(thickness: 1),
              Text('isACTIVE - ${widget.crypt.isActive.toString()}'),
              Divider(thickness: 1),
              Text('firstHistoricalData - ${widget.crypt.firstHistoricalData.toString()}'),
              Divider(thickness: 1),
              Text('lastHistoricalData - ${widget.crypt.lastHistoricalData.toString()}'),
              Divider(thickness: 1),
              Text('platform - ${widget.crypt.platform.toString()}'),

            ],
          )
        ),
      ),
    );
  }
}

