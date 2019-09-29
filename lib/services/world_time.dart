import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;

  WorldTime({ this.location, this.flag, this.url});

  // future like promise in javascript
  Future<void> getTime() async {
    // make the request
    Response response =
        await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);
    // print(data);

    //get properties 
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);

    //create datetime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    //set time property
    time = now.toString();
  }
}