//1.an Application Programming Interface(API) is a set of coomands,functions,protocols,and objects that programmers can use to create software or interact with an external system.
//1.(API),programcıların yazılım/program oluşturmak veya harici bir sistemle etkileşim kurmak için kullanabilecekleri bir dizi komut, işlev, protokol ve nesnedir.
//واجهة برمجة التطبيقات (API) هي مجموعة من الأوتار والوظائف والبروتوكولات والكائنات التي يمكن للمبرمجين استخدامها لإنشاء برنامج أو التفاعل مع نظام خارج.1
//2.it provides developers with standard commands for performing common operations so they do not have to write the code from scratch
//2.geliştiricilere ortak işlemleri gerçekleştirmek için standart komutlar sağlar, böylece kodu sıfırdan yazmak zorunda kalmazlar
// .إنه يوفر للمطورين أوامر قياسية لأداء العمليات المشتركة حتى لا يضطروا إلى كتابة الكود من البداية2
import 'package:clime/services/location.dart';
import 'package:clime/services/networking.dart';

const apiKey='YOUR APIKEY';//weather sayfasinda hesap olusturduktan sonra bize verilen key degeri koymamiz lazim yoksa calismaz
const openWeatherMapURL='https://api.openweathermap.org/data/2.5/weather';



class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {

String url='$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';//bu sekilde openWeather sayfadan city name ile bilgil nasil alinir orda gosterilyo
  NetWorkHelper netWorkHelperCityName=NetWorkHelper(url);
var weatherData =await netWorkHelperCityName.getData();//bu method future dynamic olark dondurlyo oyuzden getCity methodu dynamic yaptik
return weatherData;
  }

  Future<dynamic> getLocationWeather() async{
    //veri/bilgi baska yerden alip telefona aktarmak icin bi suru zaman alabilir bu islemler background/arka tarafta yaptirmak icin ve uygulamy durmamak icin async ve await kullaniyoz
    //location sayfasinda icindeki Location sinifindan bi object/nesne olusturyoz
    Location location = Location();
    await location.getCurrentLocation(); //bu fonks Future,async,await ile calistigi icin burdada yazmamaiz lazim.
    //ve sadece Future donduren methodlar ile await/bekleme islemi yapabilirz o yuzden location sayfasinda getCurentLoction methodu Future ile yazdik yoksa burda hata veiri
    //method islenleri bekleyip bittikten sonra o zaman latitud ve longitud sonuclari yazar/gosterck
    //  location.latitude;
    //  location.longitude;
    //ilk once lat ve long yani device'in yeri/location bilgileri alip link'e atip bu link'i uri icinde koyup json'dan  bilgileri alip respons'a atariz
    NetWorkHelper NetWorkHelpConct = NetWorkHelper('$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');//temperature Celsius olark yazmik icin en son metric kelimesi ekledik

    dynamic weatherData=await NetWorkHelpConct.getData();//sadece Future donduren methodlarla await kullanabilirz o yuzden getData methodu Future yaptik
    return weatherData;
  }


  String getWeatherIcon(int condition) {
    //openWeather sayfasinda condition yani id derecesine gore icon veya hava durmu veriliyo ona gore asgada boyle yazdik
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
   //bu method sicaklik derecesine gore icon ve cumle yazdirack
    if (temp > 25) {
      //burdaki emojiler whatsap/telegramdan da alabiliriz
      return 'It\'s 🍦 time';
    } else if (temp >= 20) {
      return 'Time for shorts🙌🏻 and 👕';
    } else if (temp <= 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}