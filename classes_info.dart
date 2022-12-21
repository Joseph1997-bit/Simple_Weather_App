void main() {
  int num=25;
  bool myage= num> 20?true :false;
  print(myage);

  Araba mycar=Araba(CarType.tesla);

  ElectricCar tesla=ElectricCar();
  print(tesla.numberOfSeat);
  tesla.drive();

  LevitingCar myLev=LevitingCar();
  myLev.drive();

}
class Araba{
  CarType carStyle;
  Araba(this.carStyle);

}

enum CarType{
  bmw,
  lucd,
  tesla
}

class Car{
  int numberOfSeat=5;

  void drive() {
    print('wheels turn');
  }
}

//inheritance/miras
//bu seklide bu sinif Car sinifi tüm bu yeteneği miras aldı
class ElectricCar extends Car{

}

//polymorphism.ayni method/ozellik adi miras aliyoz ama farkli islemler yapiyo
class LevitingCar extends Car{
  @override
  //void drive() {
  //  print('flying car');
  // }

  @override
  void drive() {
    //parent class icnde ayni ozellig kullamak icin super kelimesi kullaniyuoz ve onunla beraber farkli seyleride ekleyebiliriz
    super.drive();
    print('flying car');
  }
}




//classes and object
//object/nesne herhangi bi classtan olusturan yeni bi adat bu adat kullanark class icinde tum ozellikleri ve methodlari kullanabilriz
class Human{
  double height=0.0;
  static  int age=0;

  Human({required double  startHeigh,required int a}) {
    this.height=startHeigh;
    age=a;
  }
  void talk(String whatTosay) {
    print(whatTosay);
  }

}