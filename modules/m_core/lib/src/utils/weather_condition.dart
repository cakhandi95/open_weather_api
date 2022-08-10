import 'package:m_core/m_core.dart';

///
/// Created by Handy on 10/08/22
/// HP Pro Book 430 G1 
/// Email : it.handy@borwita.co.id
///

String getWeatherIcon(int condition) {
  if (condition < 300) {
    return Assets.condition300; // HUJAN
  } else if (condition < 400) {
    return Assets.condition400; // HUJAN PETIR.
  } else if (condition < 600) {
    return Assets.condition600; // HUJAN DERAS
  } else if (condition < 700) {
    return Assets.condition700; // SALJU
  } else if (condition < 800) {
    return Assets.condition800under; // MENDUNG GELAP
  } else if (condition == 800) {
    return Assets.condition800; // CERAH
  } else if (condition <= 804) {
    return Assets.condition804;// MENDUNG
  } else {
    return Assets.condition800;
  }
}

