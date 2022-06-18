import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class check_Calculation extends StatefulWidget {
  const check_Calculation({Key? key}) : super(key: key);

  @override
  State<check> createState() => _checkState();
}

class _checkState extends State<check> {
  var result = "";

  output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      result = eval.toString();
    });
  }

  buttonwidget(
    String text,
  ) {
    return InkWell(
      onTap: () {
        setState(() {
          result = result + text;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: Colors.lightGreen),
          color: Colors.red,
        ),
        height: 80,
        width: 70,
        child: Center(
          child: Text(
            "$text",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(left: 20),
              height: 200,
              width: MediaQuery.of(context).size.width * 10,
              child: Text(
                result,
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[900]),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buttonwidget("1"),
                buttonwidget("2"),
                buttonwidget("3"),
                buttonwidget("+"),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buttonwidget("4"),
                buttonwidget("5"),
                buttonwidget("6"),
                buttonwidget("-"),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buttonwidget("7"),
                buttonwidget("8"),
                buttonwidget("9"),
                buttonwidget("x"),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      result = "";
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.lightGreen),
                      color: Colors.red,
                    ),
                    height: 80,
                    width: 70,
                    child: Center(
                      child: Text(
                        "C",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: output,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.lightGreen),
                      color: Colors.red,
                    ),
                    height: 80,
                    width: 70,
                    child: Center(
                      child: Text(
                        "=",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                buttonwidget("0"),
                buttonwidget("/"),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
