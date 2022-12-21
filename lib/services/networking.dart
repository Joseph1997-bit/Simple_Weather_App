import 'package:http/http.dart' as http; //as http demeki http paketin icindeki methodlari(get,Response) bu kelime(hattp) kullanark ulasabiliriz boylece daha kolay ve aciklayici olur
//JSON demeki JavaScript Object Notation(işaretlerle gösterme).{key : value } bu sekilde tanimlanir
//JosnDecode methodu kullanmak icin convert paketi yazdik ve bilgi almak icin decode kullanyoz yani kod cozucu
import 'dart:convert';
class NetWorkHelper {

  NetWorkHelper(this.URL);
  final String URL;

    Future getData() async {
      //1.parametre Url.URL stands for Uniform Resource Locator. A URL is nothing more than the address of a given unique resource on the Web.
      // In theory, each valid URL points to a unique resource. Such resources can be an HTML page, a CSS document, an image
      //get methodu 1. params Uri olmasi lazim. data alip ve Future olark respons/cevap verir yani bu islemler  otomatik  async olack cunku bi suru zaman alablir
//to create a URI from string, use Uri.parse or Uri.tryParse:
      var uri = Uri.parse(URL);
//Response classi Future oldugu icin await,async get methoda eklemez lazim yoksa hata veriri
//Response classi ve get methodu nerden geldigini belirlemek icin http kelimse olusturduk ekledigimiz http paketin kisaltmasi gibi
      http.Response response = await http.get(uri);//url kullanark http get request/istek aliyoz jsondan/baska yerden bilgi almak icin
      if (response.statusCode == 200) {
        //sonra kontrol/check ediyoz eger statusCod deger 200 ise demeki linkte herhangi bi sikiti yok ve calisabilir 300/400 ise demeki sikinti var
//JOSN'dan aldigmiz (response body,yanıt organı,هيئة الاستجابة) degleri degiskene atip rahatca yazabilirz
        String data = response.body;
        //sonra response olark alidgimiz bilgi/cevap jsonDecod/kod cozucu ile istedigmiz bilgiyi alabilriz
      //her satirda (jsonDecod(data))bunu yazmamak icin decodData degiskene atadik
        var decodData = jsonDecode(data);
        return decodData;
      }
      else {
        //statusCod deger 200 deilse linkte sikinti var demeki ve statusCod degeri yazdir
        print(response.statusCode);
      }
    }
}