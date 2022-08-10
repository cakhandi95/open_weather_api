///
/// Created by handy on 09/08/22
/// Macbook Pro Retina 2015.
/// handikadwiputradev@gmail.com
///

class WeatherResponse {

  WeatherResponse({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  Coord coord;
  List<WeatherJson> weather;
  String base;
  Main main;
  int visibility;
  Wind wind;
  Clouds clouds;
  int dt;
  Sys sys;
  int timezone;
  int id;
  String name;
  int cod;

  factory WeatherResponse.fromJson(Map<String, dynamic> json) => WeatherResponse(
    coord: Coord.fromJson(json["coord"]),
    weather: List<WeatherJson>.from(json["weather"].map((x) => WeatherJson.fromJson(x))),
    base: json["base"],
    main: Main.fromJson(json["main"]),
    visibility: json["visibility"],
    wind: Wind.fromJson(json["wind"]),
    clouds: Clouds.fromJson(json["clouds"]),
    dt: json["dt"],
    sys: Sys.fromJson(json["sys"]),
    timezone: json["timezone"],
    id: json["id"],
    name: json["name"],
    cod: json["cod"],
  );

  WeatherResponse toJson() => WeatherResponse(
    coord: coord.toJson(),
    weather: List<WeatherJson>.from(weather.map((x) => x.toJson())),
    base: base,
    main: main.toJson(),
    visibility: visibility,
    wind: wind.toJson(),
    clouds: clouds.toJson(),
    dt: dt,
    sys: sys.toJson(),
    timezone: timezone,
    id: id,
    name: name,
    cod: cod,
  );

  Map<String, dynamic> toEntity() => {
    "coord": coord.toEntity(),
    "weather": List<WeatherJson>.from(weather.map((x) => x.toEntity())),
    "base": base,
    "main": main.toEntity(),
    "visibility": visibility,
    "wind": wind.toJson(),
    "clouds": clouds.toEntity(),
    "dt": dt,
    "sys": sys.toJson(),
    "timezone": timezone,
    "id": id,
    "name": name,
    "cod": cod,
  };
}

class Main {
  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
    temp: json["temp"].toDouble(),
    feelsLike: json["feels_like"].toDouble(),
    tempMin: json["temp_min"].toDouble(),
    tempMax: json["temp_max"].toDouble(),
    pressure: json["pressure"],
    humidity: json["humidity"],
  );

  Main toJson() => Main (
    temp: temp,
    feelsLike: feelsLike,
    tempMin: tempMin,
    tempMax: tempMax,
    pressure: pressure,
    humidity: humidity,
  );

  Map<String, dynamic> toEntity() => {
    "temp": temp,
    "feels_like": feelsLike,
    "temp_min": tempMin,
    "temp_max": tempMax,
    "pressure": pressure,
    "humidity": humidity,
  };
}

class Clouds {
  Clouds({
    required this.all,
  });

  int all;

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
    all: json["all"],
  );

  Clouds toJson() => Clouds(
    all: all,
  );

  Map<String, dynamic> toEntity() => {
    "all": all,
  };
}

class Coord {
  Coord({
    required this.lon,
    required this.lat,
  });

  double lon;
  double lat;

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
    lon: json["lon"].toDouble(),
    lat: json["lat"].toDouble(),
  );

  Coord toJson() => Coord(
    lon: lon,
    lat: lat,
  );


  Map <String,dynamic> toEntity() => {
    "lon": lon,
    "lat": lat,
  };
}

class Sys {
  Sys({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  int type;
  int id;
  String country;
  int sunrise;
  int sunset;

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
    type: json["type"],
    id: json["id"],
    country: json["country"],
    sunrise: json["sunrise"],
    sunset: json["sunset"],
  );

  Sys toJson() => Sys(
    type: type,
    id: id,
    country: country,
    sunrise: sunrise,
    sunset: sunset,
  );

  Map<String, dynamic> toEntity() => {
    "type": type,
    "id": id,
    "country": country,
    "sunrise": sunrise,
    "sunset": sunset,
  };
}

class WeatherJson {
  WeatherJson({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  int id;
  String main;
  String description;
  String icon;

  factory WeatherJson.fromJson(Map<String, dynamic> json) => WeatherJson(
    id: json["id"],
    main: json["main"],
    description: json["description"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "main": main,
    "description": description,
    "icon": icon,
  };

  Map<String, dynamic> toEntity() => {
    "id": id,
    "main": main,
    "description": description,
    "icon": icon,
  };
}

class Wind {
  Wind({
    required this.speed,
    required this.deg,
  });

  double speed;
  int deg;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
    speed: json["speed"].toDouble(),
    deg: json["deg"],
  );

  Wind toJson() => Wind(
    speed: speed,
    deg: deg,
  );

  Map<String, dynamic> toEntity() => {
    "speed": speed,
    "deg": deg,
  };
}
