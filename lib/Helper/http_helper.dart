import 'dart:convert';
import 'package:http/http.dart' as http;

// Network helper class it is used to get the data from the API
class NetworkData{
  NetworkData(this.url);
  final String url;

  // sync means synchronization which is one by one running of function
  // async running multiple task are running without dependencies

  // await is work with async manner meaning which data is not present
  // then the App working should not be should  , { App not wait , It will work }
  // future and stream , Two terms
  // stream - when we need continuous data flow and update in data( update in seconds)
  // future - one time call
  Future getData() async{
    // Here the data is not changing in seconds as it is a weather app ,
    // as temperature is not changing in seconds

    http.Response response=await http.get(Uri.parse(url));

    if(response.statusCode==200)
      {
        String data=response.body;
        return jsonDecode(data);
      }
    else
      {
        print(response.statusCode);
      }
  }

}
