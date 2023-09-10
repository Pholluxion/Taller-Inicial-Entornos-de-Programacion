class Student {
  final String code;
  final String sex;
  final String name;
  final String age;
  final String city;

  Student({
    required this.code,
    required this.sex,
    required this.name,
    required this.age,
    required this.city,
  });

  String toRaw() => '\r$code,$sex,$name,$age,$city';

  @override
  String toString() => '''
    {
        name: $name,  
        city: $city,  
        group: $age,  
        code: $code,  
        sex: $sex 
    }
    ''';

  factory Student.fromRawString(Map<int, String> map) => Student(
        sex: map[1]!,
        code: map[0]!,
        name: map[2]!,
        city: map[4]!,
        age: map[3]!,
      );
}
