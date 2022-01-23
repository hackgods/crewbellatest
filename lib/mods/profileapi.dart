import 'dart:convert';
import 'package:crewbellatest/models/profilemodel.dart';
import 'package:http/http.dart' as http;


class API_Manager {
    Future<Profilemodel> getDetails(String uname) async {

        var client = http.Client();
        Profilemodel profileModel = Profilemodel();

        try {
            var response = await client.get(Uri.https('py.crewbella.com', '/user/api/profile/$uname'));
                var jsonString = response.body;
                var jsonMap = json.decode(jsonString);
                print(jsonMap);
                profileModel = Profilemodel.fromJson(jsonMap);
        } catch (Exception) {
            return profileModel;
        }

        return profileModel;
    }
}

