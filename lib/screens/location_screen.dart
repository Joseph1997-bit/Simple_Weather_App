import 'package:clime/screens/city_screen.dart';
import 'package:flutter/material.dart';
import '../services/weather.dart';
import '../utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  //lodaing sayfasindan yer/location bilgileri alip burda yazdirmak icin bu constructor kullanacz
  LocationScreen({required this.locationWeather});
  dynamic locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherInfo = WeatherModel();
  double jsonTemp = 0;
  var weatherIcon;
  var weatherMesaj;
  var jsonCityName;
  @override
  void initState() {
    super.initState();
    //locationScrenState icinden locationScren classi/sayfasi ve icindeki degiskenlere ulasmak icin widget kullaniriz sayfanin/state objecti/nesne sayilir boylece constructor'a geln location/weather bilgileri cagirabiliriz
    //widget aracılığıyla/ via the widget
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
/*      if(weatherInfo == null) {// location is still disabled. aktif olmayinca ekranda boyle yazsin
        jsonTemp=0.0;
        weatherIcon='Erorr';
        weatherMesaj='Unable to get weather data';
        jsonCityName='asd';
        return;
        //return boyle yazinca it will end our method prematurely and prevent it from continuing on to the next
      }*/

      //JOSN sayfasinda biligiler ic ice oldugu icin bu sekilde cagiriyoz [1.key]sonra icindeki [2.key] ve aldigmiz respon/cevap parametre olark ilk basta koyariz data degiskeni gibi
//her satirda (jsonDecod(data))bunu yazmamak icin weatherData input'a geln bilgiler zaten response.body yani tum bilgiller sadce asgada istedigmiz bilgileri yazdiryoz
      jsonTemp = weatherData['main']['temp']; //loading sayfasinda temperature Celsius'e donusturduk o yuzden sonuclar 1_50 arasinda cikabilir
      weatherMesaj = weatherInfo.getMessage(jsonTemp.toInt());
      //JOSN'da bazi degerler dizi/items olark yazilmis[1.key(weather)][index/0][2.key].items 0'dan basldigi icin 2.parntezde 0 koyariz butun keyler icin boylece cagiriz
      var jsonCondition = weatherData['weather'][0]['id'];
      weatherIcon = weatherInfo.getWeatherIcon(jsonCondition);
      jsonCityName = weatherData['name'];
      print(weatherData['coord']['lon']);
      print(weatherData['coord']['lat']);
      print(jsonTemp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/weather.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.2), BlendMode. dstOut),
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () async {
                        var weatherData = await weatherInfo.getLocationWeather(); //bu buttoni basinca telefonun yeri/location bilgileri alip ve ekranda hava durmu gosterck
                        updateUI(weatherData); //location bilgileri alip upData'e atcz ve Boylece istedigmiz bilgileri ekranda gostercz
                      },
                      child: Icon(
                        Icons.home,
                        size: 50.0,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async{
                        //cityScren sayfasinda get weather basinca ve pop methodu calistirnca onunla beraber city adi parametre olark buraya gonderip typeNme degiskene atcz cunku bu button cityScren'e yonlendirilyo
                        //getWeather ve pop methodu ne zaman basacagimz belli degil o yuzden bu method Future yani soz basilack simdi degil geleckte o yuzden bunu kullanmak icin
                        //bu degiskeni async yapmamiz lazim await ve async ile
                         var cityName = await Navigator.push(context, MaterialPageRoute(builder: (context) => CityScreen(),));
                         if(cityName != null) {
                           //upData fonksyuna calismadan once bilgi vermemiz lazim o yuzden await ile yazdik
                         var weatherData= await weatherInfo.getCityWeather(cityName);
                              updateUI(weatherData);
                         }

                      },
                      child: Icon(
                        Icons.location_city_sharp,
                        size: 50.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 80,),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '${jsonTemp.toStringAsFixed(0)}',
                        style: kTempTextStyle,
                      ),
                      Text(
                        '${weatherIcon}',
                        style: kConditionTextStyle,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Text(
                    "$weatherMesaj in $jsonCityName",
                    textAlign: TextAlign.center,
                    style: kMessageTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
