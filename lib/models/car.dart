class Car {
  int id;
  String model;
  String color;
  String number;
  int year;
  String photo;

  Car({
    required this.id,
    required this.model,
    required this.color,
    required this.number,
    required this.year,
    required this.photo,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id'],
      model: json['model'],
      color: json['color'],
      number: json['number'],
      year: json['year'],
      photo: json['photo'],
    );
  }
}
