import 'dart:convert';

import 'package:covid/dataSource.dart';
import 'package:covid/pages/countryPage.dart';
import 'package:covid/panels/infopanel.dart';
import 'package:covid/panels/mosteffectedcountries.dart';
import 'package:covid/panels/worldWidePanels.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  // A Dart Map is a collection of key-value pairs.
  // It maps each key to exactly one value. We can iterate over a Map.

  Map worldData;
  fetchWorldWideData() async {
    http.Response response = await http.get("https://corona.lmao.ninja/v2/all");
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  List countryData;
  fetchCountryData() async {
    http.Response response = await http.get("https://corona.lmao.ninja/v2/countries");
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchWorldWideData();
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid-19 Tracker"),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 100,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              color: Colors.orange[100],
              child: Text(
                  DataSource.quote,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[800],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text("WorldWide", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                   GestureDetector(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => CountryPage()));
                     },
                     child: Container(
                       decoration: BoxDecoration(
                         color: primaryBlack,
                         borderRadius: BorderRadius.circular(15),
                       ),

                         padding: EdgeInsets.all(10),
                         child: Text(
                           "Regional",
                           style: TextStyle(
                               fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                         ),
                     ),
                   ),
                 ],
               ),
            ),
            worldData==null?CircularProgressIndicator():WorldWidePanel(worldData: worldData,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text("Most Affected Countries", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 10,),
            countryData==null?Container():MostAffectedPanel(countryData: countryData,),
            SizedBox(height: 20,),
            InfoPanel(),
            SizedBox(height: 20,),
            Center(child: Text("PRAY TO ALLAH TO PROTECT US FROM CORONA", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
            SizedBox(height: 50,),
          ],
        ),
      )
    );
  }
}