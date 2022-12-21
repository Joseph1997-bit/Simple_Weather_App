import 'dart:io';
//kisaca async demeki arkaTarafta islemleri yapmak icin await demeki bu fonksyunu bitene kadar bekle sonra soncu yaz Future demeki soz verioz geleckte bi deger vercz
//future yazmayinca fonks icinde asnyc ve await kullansak bile bu fonksyunu baska yerde cagrip calistirmak icin Future ile baslamasi lazim yoksa hata verir
void main() {
  performTasks();
}
//sadece async yazsak task1 ve task3 yazar sonra task2 yazck sirayla degil ama calisir bu dogru degil cunku burda task2 sonucu task3'e parametre olarak atmamiz lazim
//o yuzden async ve await beraber yaziyoz demeki task2'yi bitene kadar bekle islemi bittirdikten sonra dondur ve task3'e akatr
//boylece sirayla yazilack ve dogru bi sekil task1 sonra task2 sonra task3
void performTasks()  async{
  task1();
 String task2Result= await task2();//async ve await ile calistiracgimiz fonksyun burda da async ve await yazmamiz lazim yoksa calismaz
  task3(task2Result);//await kelimesi cagiracagimiz fonksyun onunde koyariz
}


void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}


//bu fonks Future ile basladigi icin async demeki.Future bilet gibi dusun bilet alirken direk gidemezsin ama ayni gunde bi suru seyler yapabilirsin ve bilet zamani gelince gidersin
Future<String>  task2()  async{//Future yazinca demkei bu fonks geleckte calisack ve string olark  sonc dondureck simidi degil islemleri bitince calisir
 //Future<String> yani geleckte string olark bi sonuc vercek yada baska bi tip/type olabilr int,double.vs..
  String result='';
  Duration threesec=Duration(seconds: 3);
//async yazinca islemleri arkada yapilack demeki await'yazinca bu fonks sonuc vermeyck islemler arkada bittikten sonra sonuc verck
  await Future.delayed(threesec,() {
    //run basinca ilk basta task1 ve task3 yazdirack ve 3saniye sonra task2 yazdirck tam bekledigmiz gibi
    // async oldugu icin task2  yazdirmadi direk task1 ve task3 sonra task2 yazdi. task1,task3  yazarken ayni anda task2 islemi arkada hala devam ediyo bitirdiginde yazar bu isleme async denir
     result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;

}

void task3(String task2Data) {
  String result = 'task 3 data';
  print('Task 3 complete $task2Data');
}

/* Duration threesec=Duration(seconds: 3);
  sleep(threesec); //bu fonks sayesinde asgadaki islemler 3 saniye sonra calisir */