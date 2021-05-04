import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class LocationCardsModal {
  String placeName;
  String placeAddress;

  LocationCardsModal({this.placeName, this.placeAddress});
}

// ignore: missing_return
Future<List<LocationCardsModal>> fillCityName(String cityName) async {
  if (cityName.length > 0) {
    http.Response tokenGet = await http.post(
        'https://outpost.mapmyindia.com/api/security/oauth/token?grant_type=client_credentials&client_id=33OkryzDZsJmp0siGnK04TeuQrg3DWRxswnTg_VBiHew-2D1tA3oa3fthrGnx4vwbwlbF_xT2T4P9dykuS1GUNmbRb8e5CUgz-RgWDyQspeDCXkXK5Nagw==&client_secret=lrFxI-iSEg9xHXNZXiqUoprc9ZvWP_PDWBDw94qhrze0sUkn7LBDwRNFscpDTVFH7aQT4tu6ycN0492wqPs-ewpjObJ6xuR7iRufmSVcnt9fys5dp0F5jlHLxBEj7oqq');
    var body = jsonDecode(tokenGet.body);
    var token = body["access_token"];
    http.Response response1 = await http.get(
      'https://atlas.mapmyindia.com/api/places/search/json?query=$cityName&pod=CITY',
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );
    var adress = (jsonDecode(response1.body));
    adress = adress["suggestedLocations"];
    List<LocationCardsModal> card = [];
    for (var json in adress) {
      LocationCardsModal locationCardsModal = new LocationCardsModal();
      locationCardsModal.placeName = json["placeName"];
      locationCardsModal.placeAddress = json["placeAddress"];
      card.add(locationCardsModal);
    }
    card = card
      ..sort(
          (a, b) => a.placeName.toString().compareTo(b.placeName.toString()));
    return card;
  }
}
