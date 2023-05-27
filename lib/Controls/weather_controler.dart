import 'package:get/get.dart';
import 'package:weatherapp/Helper/http_helper.dart';
const weatherAPIURL='https://api.openweathermap.org/data/2.5/weather';
class WeatherController extends GetxController{
  RxBool isLoading=true.obs;
  RxString weatherMain='Weather'.obs;
  RxString weatherDescription='Weather Description'.obs;
  RxString icon='Icon'.obs;

  RxDouble temperature=0.0.obs;
  RxDouble minTemp=0.0.obs;
  RxDouble maxTemp=0.0.obs;
  RxDouble pressure=0.0.obs;
  RxDouble humidity=0.0.obs;
  RxDouble clouds=0.0.obs;
  RxDouble seaLevel=0.0.obs;
  RxDouble visibility=0.0.obs;
  RxDouble wind=0.0.obs;

@override
void onInit() async{
  super.onInit();
  getLocationWeather(
    22.7196,
    75.8577,
  );
}
@override
 void onClose(){

}
Future<dynamic>getLocationWeather(double latitude, double longitude) async
{
  NetworkData networkHelper = NetworkData(
      '$weatherAPIURL?lat=$latitude&lon=$longitude&appid=17ea35675fe0a6cf9086dde6974913d8&units=metric');

  // Now getting the data by using the function get data
  var weatherData = await networkHelper.getData();
  print(weatherData);
  // var weatherMain;
  weatherMain.value = weatherData['weather'][0]['main'];
  weatherDescription.value = weatherData['weather'][0]['description'];
  icon.value = '${"http://openweathermap.org/img/w" + weatherData['weather'][0]['icon']}.png';
  temperature.value = weatherData['main']['temp'] + 0.0;
  minTemp.value = weatherData['main']['temp_min'] + 0.0;
  maxTemp.value = weatherData['main']['temp_max'] + 0.0;
  pressure.value = weatherData['main']['pressure'] + 0.0;
  humidity.value=weatherData['main']['humidity'] + 0.0;
  clouds.value=weatherData['clouds']['all'] + 0.0;
 seaLevel.value=weatherData['main']['sea_level'] + 0.0;
  visibility.value=weatherData['visibility'] + 0.0;
  wind.value=weatherData['wind']['speed']+0.0;
}
}
