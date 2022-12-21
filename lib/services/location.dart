
import 'package:geolocator/geolocator.dart';
//kod karmasik olmasin diye bu classi olusturduk
class Location {
  double latitude=0.0;
  double  longitude=0.0;



  Future<void>getCurrentLocation() async {
//asenkron/async olunca uyglamda 1'den fazla islem ayni zamanda yapabilir bekleme yapmadan
//senkron/synchrony olunca yani async kelimesi kullanmayinca islemler sirayla yapilack 1,islem bitirip sonra 2.islemi devam eder
//veri/bilgi baska yerden alip telefona aktarmak icin bi suru zaman alabilir bu islemler background/arka tarafta yaptirmak icin
// ve uygulamy durmamak icin await ve async kullaniyoz
    try {
     LocationPermission permission = await Geolocator.checkPermission(); //device/telefonda permision/izin durumu kontrol/check ediyoruz

      if (permission == LocationPermission.denied) { //eger permision/izin yoksa izin aliyoruz.eger varsa bu islemlere gerek yok
        await Geolocator.requestPermission();

        return;
      } else if (permission == LocationPermission
          .deniedForever) { //eger permision/izin durumu forever ise seting/ayarlar'i acip ordan izin aliyoz
        await Geolocator.openLocationSettings();

        return;
      } else { //eger izin varsa bize telefonun  Latitude/خط العرض ve Longitude/خط الطول bilgileri yazdir/ver
        final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);//eger izin varsa bu fonks calisip locatiob bilgileri verir
        latitude=position.latitude;
        longitude=position.longitude;
        print('nothing wrong');
     }
    } catch (e) {
      print(e);
    }
  }

}


