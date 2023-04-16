import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
import 'package:vr/gyroscope_data_view.dart';

class GyroscopeImageView extends StatefulWidget {
  const GyroscopeImageView({Key? key});

  @override
  _GyroscopeImageViewState createState() => _GyroscopeImageViewState();
}

class _GyroscopeImageViewState extends State<GyroscopeImageView> {
  double _x = 0.0;
  double _y = 0.0;
  double _z = 0.0;
  List<String> _gyroData = [];

  @override
  void initState() {
    super.initState();
    gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        _x = event.x;
        _y = event.y;
        _z = event.z;
        _gyroData.add("X: $_x,\nY: $_y,\nZ: $_z");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Transform(
            transform: Matrix4.rotationX(_x) *
                Matrix4.rotationY(_y) *
                Matrix4.rotationZ(_z),
            alignment: FractionalOffset.center,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 200,
              height: 200,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "X: $_x\nY: $_y\nZ: $_z",
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GyroscopeDataView(gyroData: _gyroData),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple, // Set the text color
          ),
          child: const Text('View Data'),
        ),
      ],
    );
  }
}
