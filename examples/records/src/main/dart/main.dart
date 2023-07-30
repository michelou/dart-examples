import 'dart:math';

// https://medium.com/@dnkibere/dart-3-records-pattern-matching-sealed-classes-and-more-12a9e3a52447
void example1() {
  (String, int, double, {int age, String name}) x = ("23", 0, 77.0, age: 20, name: "Doe");

  print('x=$x');
  print('x.\$2=${x.$2}');
  print('x.name=${x.name}');

  (String, int) greet(String name) {
    int ticketNo = Random().nextInt(100);
    return ("Hello $name! Your ticket is: ", ticketNo);
  }
  
  var g = greet('John');
  print('${g.$1}${g.$2}');
}

// https://www.darttutorial.org/dart-tutorial/dart-record/
void example2() {
  final location = (lat: 10.0, lon: 20.0);
  final lat = location.lat;
  final lon = location.lon;
  print('(\$lat, \$lon)=($lat, $lon)');

  (double?, double?) minmax(List<double> numbers) {
    if (numbers.length == 0) {
      return (null, null);
    }

    double min = numbers[0];
    double max = numbers[0];

    for (int i = 1; i < numbers.length; i++) {
      if (numbers[i] < min) {
        min = numbers[i];
      }

      if (numbers[i] > max) {
        max = numbers[i];
      }
    }
    return (min, max);
  }

  final result = minmax([5, 2, 3, 7, 0, -1]);
  print(result);
}

void main() {
  example1();
  print('');
  example2();
}
 