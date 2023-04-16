import 'package:flutter/material.dart';

class GyroscopeDataView extends StatefulWidget {
  final List<String> gyroData;

  const GyroscopeDataView({Key? key, required this.gyroData}) : super(key: key);

  @override
  _GyroscopeDataViewState createState() => _GyroscopeDataViewState();
}

class _GyroscopeDataViewState extends State<GyroscopeDataView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gyroscope Data'),
      ),
      body: ListView.builder(
        itemCount: widget.gyroData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.gyroData[index]),
          );
        },
      ),
    );
  }
}
