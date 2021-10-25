class Menu {
  List<Drink>? foods;
  List<Drink>? drinks;

  Menu({this.foods, this.drinks});

  Menu.fromJson(Map<String, dynamic> json) {
    foods = List<Drink>.from(json['foods'].map((x) => Drink.fromJson(x)));
    drinks = List<Drink>.from(json['drinks'].map((x) => Drink.fromJson(x)));
  }

  Map<String, dynamic> toJson() {
    return {
      'foods': List<dynamic>.from(foods!.map((e) => e.toJson())),
      'drinks': List<dynamic>.from(drinks!.map((e) => e.toJson())),
    };
  }
}

class Drink {
  String? name;

  Drink({this.name});

  Drink.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
