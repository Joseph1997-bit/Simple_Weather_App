
import 'package:clime/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';



class LoadingScreen extends StatefulWidget {
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  getLocationAndData() async {
dynamic weatherData= await WeatherModel().getLocationWeather();//bu method cagirinca soncu bekletip sonra baska yere atcaz yoksa dogru sonuc vermez oYuzden await yazdik baska sayfaya bagla

    //getLocationAndData methodu calinca direk navigator uzerinden/kullanark locationScreen sayfasina yonlendireck bizi yada calistirack
    Navigator.push(context, MaterialPageRoute(builder: (context) {
  return  LocationScreen(locationWeather: weatherData,);
},));


  }

  @override
  void initState() {
    //bu class icindeki sayfayi calistirinca/cagirnca bu fonks ve icindekiler otomatik olark direk calisir.bazi uygulamlarda bu fonks kulanmak faydali olur
    super.initState();
    getLocationAndData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitHourGlass(
          color: Colors.teal,
          size: 150.0,
          //duration: Duration(seconds: 1),
        )
      ),
    );
  }
}