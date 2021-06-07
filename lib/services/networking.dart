import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future getData() async {
    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);

        // double longitude = decodedData['coord']['lon'];
        // double latitude = decodedData['coord']['lat'];
        // String description = decodedData['weather'][0]['description'];
        // String country = decodedData['sys']['country'];
        // String city = decodedData['name'];
        // double temperature = decodedData['main']['temp'];
        // int condition = decodedData['weather'][0]['id'];

        return decodedData;
      } else {
        print(
            'Request failed with status: \n${response.statusCode} \n${response.body}.');
      }
    } catch (e) {
      print('an error occurred:');
      print(e);
    }
  }
}
