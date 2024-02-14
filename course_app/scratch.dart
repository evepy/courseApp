void main() {
  const String name = "Evelyn";
  print(name);
  ///////////////
  int age = 23;
  print("My name is $name and my age is $age!");

  ///Como Swift tiene matrices, Dart tiene listas
  var hobbies = <String>["coding", "biking", "reading"];
  ////Funciones en Dart para realizar una operacion particular repetidamente
  void showInfo() {
    print("My name is Sai and I am 19 years old");
  }

  showInfo();
  //Funcion con argumentos  (este tiene un argumento null)
  void showInfoTwo({String? name}) {
    print("My name is $name");
  }

  showInfoTwo(name: "Lol");
  //Funcion que retorna un valor (este tiene un argumento requerido)
  int addFive({required int number}) {
    return 5 + number;
  }

  print("5 + 5 is ${addFive(number: 5)}");
}
