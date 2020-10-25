import 'package:flutter/material.dart';
import 'package:menuapp/Component/dialogtext.dart';
import 'package:menuapp/country.dart';

class ImageGrid extends StatefulWidget {
  ImageGrid(
      {this.text,
      this.flag,
      this.confirmed,
      this.active,
      this.critical,
      this.deaths,
      this.recovered,
      this.todayCases,
      this.todayDeaths,
      this.todayRecovered});
  final String text;
  final String flag;
  final int confirmed;
  final int todayCases;
  final int deaths;
  final int todayDeaths;
  final int recovered;
  final int todayRecovered;
  final int active;
  final int critical;

  @override
  _ImageGridState createState() => _ImageGridState();
}

class _ImageGridState extends State<ImageGrid> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 16,
                child: Container(
                  height: 420.0,
                  width: 360.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Spacer(),
                          DialogText(
                            text: "${widget.text}",
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          Spacer(
                            flex: 2,
                          ),
                        ],
                      ),
                      Image.network(
                        widget.flag,
                        height: 75,
                      ),
                      DialogText(
                        text: 'Confirmed: ${widget.confirmed.toString()}',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                      DialogText(
                        text: 'Deaths: ${widget.deaths.toString()}',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                      DialogText(
                        text: 'Recovery: ${widget.recovered.toString()}',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                      DialogText(
                        text: 'Active Cases: ${widget.active.toString()}',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                      DialogText(
                        text: 'Critical Cases: ${widget.critical.toString()}',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                      DialogText(
                        text: 'Today Cases: ${widget.todayCases.toString()}',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                      DialogText(
                        text: 'Today Deaths: ${widget.todayDeaths.toString()}',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                      DialogText(
                        text:
                            'Today Recovery: ${widget.todayRecovered.toString()}',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  ),
                ),
              );
            });
      },
      child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(
                  widget.flag,
                  height: 75,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 7.0,
                spreadRadius: 3.0,
                offset: Offset(0.0, 0.0),
              ),
            ],
            color: Colors.white70,
          ),
          margin: EdgeInsets.all(10),
          height: 150.0),
    );
  }
}
