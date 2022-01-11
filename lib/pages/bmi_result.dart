import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key, this.weight, this.height, this.bmi, this.node})
      : super(key: key);

  final String? weight;
  final String? height;
  final String? node;
  final String? bmi;

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String? _node;
  double? _bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI RESULT'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(''),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
              vertical: 10)),
            Text('ค่า BMI ที่ได้',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blueGrey,
                )),
            Padding(
              padding: EdgeInsets.symmetric(
              vertical: 10)),
            Row(
              children: [
                weight(),
                height(),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
              vertical: 10)),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    calculate();
                  },
                  child: Text(
                    'คำนวณค่า',
                    style: TextStyle(fontSize: 15),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(260, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(62)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                  vertical: 5)),
                bmi(),
                Padding(
                  padding: EdgeInsets.symmetric(
                  vertical: 10)),
                node(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container node() {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xffccaadd),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            blurRadius: 12,
            color: Color(0xFFce93d8),
          )
        ],
      ),
      child: Text(
        _node == null ? '' : _node!.toString(),
        style: TextStyle(fontSize: 24),
        textAlign: TextAlign.center,
      ),
    );
  }

  Container bmi() {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 25, 30, 10),
      padding: EdgeInsets.only(top: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xffccaadd),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 6),
            blurRadius: 12,
            color: Color(0xFFce93d8),
          )
        ],
      ),
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 5)),
          Text(
            'BMI',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          Text(
            _bmi == null ? '' : _bmi!.toStringAsFixed(2),
            style: TextStyle(
                fontSize: 62,
                fontWeight: FontWeight.w500,
                color: Colors.purpleAccent[700]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Container height() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffccaadd),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 10,
            color: Color(0xFFce93d8),
          )
        ],
      ),
      margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
      width: 140,
      height: 120,
      child: Padding(
        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            Text(
              widget.height! + ' ซม.',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  Container weight() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffccaadd),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 10,
            color: Color(0xFFce93d8),
          )
        ],
      ),
      margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
      width: 140,
      height: 120,
      child: Padding(
        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            Text(
              widget.weight! + ' กก.',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  void calculate() {
    double weights = double.parse(widget.weight!);
    double heights = double.parse(widget.height!) / 100;
    double heightSquare = heights * heights;

    setState(() {
      double bmi = weights / heightSquare;
      _bmi = bmi;

      if (_bmi! < 18.5) {
        _node = 'ผอมแห้ง';
      } else if (_bmi! <= 22.99) {
        _node = 'ปกติ';
      } else if (_bmi! <= 24.99) {
        _node = 'ท้วม';
      } else if (_bmi! <= 29.99) {
        _node = 'อ้วน';
      } else if (_bmi! <= 39.99) {
        _node = 'อ้วนมากๆ';
      } else {
        _node = 'อ้วนมากๆๆ';
      }
    });
  }
}
