import 'package:covid/dataSource.dart';
import 'package:covid/pages/faqs.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => FaqsPage()));
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                      "FAQ'S",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              launch("https://covid19responsefund.org/en/");
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "DONATE",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              launch("https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters");
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "MYTH BUSTERS",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}