import 'package:flutter/material.dart';
import '../utilities/constants.dart';


class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName='London';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/backGroundCity.jpg'),
            fit: BoxFit.cover,
          ),
        ),
     // constraints: BoxConstraints.expand(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(//bi tane widget sag/sol yukarda/asgada koymak icin kullanilir
              alignment: Alignment.topLeft,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_rounded,
                  size: 50.0,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child:TextField(
                  cursorColor: Colors.black,//yazarken isaret koyan cizginin rengi
                  style: TextStyle(color: Colors.white,fontSize: 27.0),
                  decoration:KTextFieldStyle,
                  onChanged: (value) {
                    cityName=value;
                  }
              ),

            ),
            SizedBox(height: 15.0,),
            ElevatedButton(

              onPressed: () {
            //    FocusManager.instance.primaryFocus?.unfocus();//textField icinde keyboardi kapatmak icin
                Navigator.pop(context,cityName);

              },
              child: Text(
                'Get Weather',
                style: kButtonTextStyle,
              ),
            ),



          ],
        ),
 ),
      ),
    );
  }
}