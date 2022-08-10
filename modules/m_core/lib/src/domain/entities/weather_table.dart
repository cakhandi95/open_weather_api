import 'package:equatable/equatable.dart';

///
/// Created by Handy on 10/08/22
/// HP Pro Book 430 G1 
/// Email : it.handy@borwita.co.id
///

class WeatherTable extends Equatable {
  
  final int id;
  final String city;
  final String latitude;
  final String longitude;
  final String temperature;
  final String description;

  const WeatherTable({required this.id, required this.city, required this.latitude, required this.longitude, required this.temperature, required this.description});

  factory WeatherTable.fromJson(Map<String,dynamic> json) => WeatherTable(
    id : json['id'],
    city : json['city'],
    latitude: json['latitude'],
    longitude: json['longitude'],
    temperature: json['temperature'],
    description: json['description'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'city': city,
    'latitude': latitude,
    'longitude': longitude,
    'temperature': temperature,
    'description': description,
  };

  WeatherTable toEntity() => WeatherTable(
    id : id,
    city : city,
    latitude: latitude,
    longitude: longitude,
    temperature: temperature,
    description: description,
  );
  
  @override
  List<Object?> get props => [
    id,
    city,
    latitude,
    longitude,
    temperature,
    description
  ];

}
