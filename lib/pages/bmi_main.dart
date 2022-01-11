import 'package:bmi_app/pages/bmi_result.dart';
import 'package:flutter/material.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({Key? key}) : super(key: key);

  @override
  _BMIPageState createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _weight = TextEditingController();
  TextEditingController _height = TextEditingController();
  double? _bmi;
  String? _node;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('BMI'),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  weight(),
                  SizedBox(
                    height: 16,
                  ),
                  height(),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  var route = MaterialPageRoute(
                    builder: (context) => ResultPage(
                      weight: _weight.text,
                      height: _height.text,
                    ),
                  );
                  Navigator.push(context, route);
                }
              },
              child: Text('SUBMIT'),
            )
          ],
        ),
      ),
    );
  }

  TextFormField height() {
    return TextFormField(
    controller: _height,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter height ';
        }
        return null;
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: ('ส่วนสูง'),
            icon: Icon(Icons.trending_up),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.orange,
            width: 2.0,
          )),
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.orange,
            width: 2.0,
          ))),
    );
  }

  TextFormField weight() {
   return TextFormField(
     controller: _weight,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter weight ';
        }
        return null;
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: ('น้ำหนัก'),
           icon: Icon(Icons.line_weight),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.orange,
            width: 2.0,
          )),
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.orange,
            width: 2.0,
          ))),
    ); 
  }
}
