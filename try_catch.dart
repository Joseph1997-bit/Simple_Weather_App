

void main() {

  //kodu derlemeden once herhangi bi hata yok ama calistirdiktan sonra hata verir cunku harfleri rakmlara ceviremeyiz
  String myString='abc';
  double myDoubleAsStrng=0;

  //uygulamayi yayinlamadan once ve uygulamamizi durmamak icin kodlari try icinde koymaliyiz
  //uygulamayi calistirdiktan sonra yada run bastiktan sonra herhangi bi hata olup olmadigini kontrol etmeliyiz ve hatanin tipi de bilebiliriz
  //eger boyle tip hatalar catch icinde yakalamazsak ve duzeltmezsek yada uyri koymazsak uygulama durur ve kapanir
  //bazi hatalar uygulamaya/duruma/internete gore cikabilir o yuzden kodu try&catch icinde koup uyari veririz boylece uygulama tamamen durmaz
  try{
    double myDoubleAsStrng= double.parse(myString);
    print(myDoubleAsStrng );

  }

  catch(e) {//e=Exception
    print(e);
    //hata varsa onu yazdir/goster sonra
    //eger herhangi bi hata varsa bu degiskene defult bi deger verip calistirabiliriz uygulama durmadan
    myDoubleAsStrng=12.1;
  }

  print(myDoubleAsStrng);
}

/*
eger bu degiskende deger varsa onu kullan yoksa/null ise sagdaki deger/defult value kullan
print(  someVaribal/degisken ??  12/defultValue  );
*/

/* try {
  //do somthing that might fail
}
catch(e) {
  //catch an exceptions that occur
}
*/
