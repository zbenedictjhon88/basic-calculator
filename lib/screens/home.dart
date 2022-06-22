import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {

  String _num1 = '', _num2 = '', _op = '';
  int _total = 0;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery
        .of(context)
        .size;
    var heightHalf = media.height / 2;
    return Scaffold(
        body: SafeArea(
          child: Container(
            height: media.height,
            width: media.width,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  height: heightHalf,
                  width: media.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        color: Color(0xFF39AFEA),
                        height: heightHalf/4,
                        child: Center(
                          child: Text('Basic Calculator', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 24.0, color:Colors.white,)),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(_num1 + _op + _num2, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0)),
                            Text(_total==0?'':'='+_total.toString(), style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24.0))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: heightHalf,
                  width: media.width,
                  color: Color(0xFFF4F4FB),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          btn(
                              media,
                              heightHalf,
                              const Text('7', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                              7
                          ),
                          btn(
                              media,
                              heightHalf,
                              const Text('8', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                              8
                          ),
                          btn(
                              media,
                              heightHalf,
                              const Text('9', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                              9
                          ),
                          btn(
                              media,
                              heightHalf,
                              const Text('*', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                              'x'
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          btn(
                              media,
                              heightHalf,
                              const Text('4', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                              4
                          ),
                          btn(
                              media,
                              heightHalf,
                              const Text('5', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                              5
                          ),
                          btn(
                              media,
                              heightHalf,
                              const Text('6', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                              6
                          ),
                          btn(
                              media,
                              heightHalf,
                              const Text('-', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                              '-'
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          btn(
                              media,
                              heightHalf,
                              const Text('1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                              1
                          ),
                          btn(
                              media,
                              heightHalf,
                              const Text('2', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                              2
                          ),
                          btn(
                              media,
                              heightHalf,
                              const Text('3', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                              3
                          ),
                          btn(
                              media,
                              heightHalf,
                              const Text('+', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                              '+'
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          btn(
                              media,
                              heightHalf,
                              const Text('C', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                              'c'
                          ),
                          btn(
                              media,
                              heightHalf,
                              const Text('0', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                              0
                          ),
                          btn(
                              media,
                              heightHalf,
                              const Text('/', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                              '/'
                          ),
                          btn(
                              media,
                              heightHalf,
                              const Text('=', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                              '='
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

  Widget btn(media, heightHalf, name, value){
    return GestureDetector(
      onTap: () {

        if(value == 'x' || value == '/' || value == '-' || value == '+'){
          _op = value.toString();
        } else if(value == '='){
          if(_op == '+'){
            _total = int.parse(_num1) + int.parse(_num2);
          }
          if(_op == 'x'){
            _total = int.parse(_num1) * int.parse(_num2);
          }
          if(_op == '-'){
            _total = int.parse(_num1) - int.parse(_num2);
          }
          if(_op == '/'){
            _total = int.parse(_num1) ~/ int.parse(_num2);
          }
        } else if(value == 'c'){
          _num1 = '';
          _num2 = '';
          _op = '';
          _total = 0;
        } else {
          if(_num1.isEmpty) {
            _num1 = value.toString();
          } else {
            if(_op.isEmpty){
              _num1 = _num1 + value.toString();
            } else {
              if(_num2.isEmpty) {
                _num2 = value.toString();
              } else {
                _num2 = _num2 + value.toString();
              }
            }
          }
        }

        setState(() {
          _num1 = _num1;
          _num2 = _num2;
          _op = _op;
          _total = _total;
        });

      },
      child: Container(
        width: media.width / 4,
        height: heightHalf / 4,
        decoration: BoxDecoration(
          //color: Colors.white,
            border: Border.all(color: Colors.grey, width: 0.5)
        ),
        child: Center(
          child: name,

        ),
      ),
    );
  }
}