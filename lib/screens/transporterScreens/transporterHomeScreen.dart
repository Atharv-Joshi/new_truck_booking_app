import 'package:Liveasy/screens/shipperOrTransporterChoiceScreen.dart';
import 'package:Liveasy/screens/transporterScreens/transporterShowMapUsingImeiScreen.dart';
import 'package:Liveasy/widgets/truckDetailsCardGenerator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Liveasy/models/providerData.dart';
import 'package:geolocator/geolocator.dart';
import 'package:Liveasy/screens/transporterScreens/transporterFindLoadScreen.dart';
import 'package:Liveasy/screens/transporterScreens/transporterFoundLoadsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:Liveasy/models/gpsDataModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:location_permissions/location_permissions.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

var controller1 = TextEditingController();
var controller2 = TextEditingController();
String loadingPoint = '';
String unloadingPoint = '';
String apikey = 'AIzaSyCI8bvNwE05B7Cp03Rvc-QsMX9QjY-EsS4';
class TsHomeScreen extends StatefulWidget {
  final User user;

  TsHomeScreen({this.user});
  @override
  _TsHomeScreenState createState() => _TsHomeScreenState();
}

class _TsHomeScreenState extends State<TsHomeScreen> {
   Position userLocation;
   bool showModalProgressHUD = false;
  getUserLocation()async{
    PermissionStatus permission = await LocationPermissions().checkPermissionStatus();
    if (permission == PermissionStatus.granted){
      userLocation = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print(userLocation);
    }
  }
  String city = '';
  PageController _controller = PageController(initialPage: 0,);
  void getCurrentLocation() async {
        PermissionStatus permission = await LocationPermissions().checkPermissionStatus();
        if (permission == PermissionStatus.granted){
          userLocation = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        }

      // var position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      // final coordinates = new Coordinates(position.latitude, position.longitude);
      // var addresses =
      // await Geocoder.local.findAddressesFromCoordinates(coordinates);
      // var first = addresses.first;
      // print(first.addressLine);
      // http.Response tokenGet = await http.post('https://outpost.mapmyindia.com/api/security/oauth/token?grant_type=client_credentials&client_id=33OkryzDZsJmp0siGnK04TeuQrg3DWRxswnTg_VBiHew-2D1tA3oa3fthrGnx4vwbwlbF_xT2T4P9dykuS1GUNmbRb8e5CUgz-RgWDyQspeDCXkXK5Nagw==&client_secret=lrFxI-iSEg9xHXNZXiqUoprc9ZvWP_PDWBDw94qhrze0sUkn7LBDwRNFscpDTVFH7aQT4tu6ycN0492wqPs-ewpjObJ6xuR7iRufmSVcnt9fys5dp0F5jlHLxBEj7oqq');
      // print(tokenGet.statusCode);
      // print(tokenGet.body);
      // var body = jsonDecode(tokenGet.body);
      // var token = body["access_token"];
      // http.Response response = await http.get('https://atlas.mapmyindia.com/api/places/geocode?address=${first.addressLine}',
      //   headers: {HttpHeaders.authorizationHeader: "$token"},);
      // print(response.statusCode);
      // print(response.body);
      // var adress = jsonDecode(response.body);
      // print(adress);
      // var cityName = adress["copResults"]["city"];
      // var stateName = adress["copResults"]["state"];
      // city = '$cityName ($stateName)';
        city = "UserCity";
      print(city);
      // http.Response response1 = await http.get('https://atlas.mapmyindia.com/api/places/search/json?query=alwar',
      //   headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},);
      // print(response1.statusCode);
      // print(response1.body);
      // var adressa = jsonDecode(response1.body);
      // print(adressa);
  }
  var geolocator = Geolocator();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    getUserLocation();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          drawer: Container(
            width: 250,
            child: Drawer(
              child: ListView(
                children: [
                  Container(
                    height: 150,
                    child: DrawerHeader(
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            child: Icon(Icons.home),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            widget.user == null
                                ? '+911234567891'
                                : widget.user.phoneNumber,
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      FirebaseAuth.instance.signOut();

                      Navigator.pushAndRemoveUntil(
                          context,  MaterialPageRoute(builder: (context) => ChoiceScreen()), (route) => false);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: ListTile(
                        title: Text(
                          'Sign Out',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        trailing: Icon(
                          Icons.exit_to_app,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: Color(0xFFF3F2F1),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFF525252),
                    border: Border.all(color: Colors.black, width: 1),
                    //borderRadius: BorderRadius.only(bottomRight: Radius.circular(19),bottomLeft: Radius.circular(19),),
                  ),
                  padding: EdgeInsets.only(bottom: 10, top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 25,),
                          Container(
                            child: GestureDetector(
                                onTap: (){
                                  _scaffoldKey.currentState.openDrawer();
                                  },
                                child: Icon(Icons.list, size: 30,color: Colors.white,)),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            child: Text('LiveEasy', style: TextStyle(fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Container(
                        height: 30,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            SizedBox(width: 25,),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: currentPage == 0 ? Colors.white30: Color(0xFF525252),
                                borderRadius: BorderRadius.circular(19),
                              ),
                              child: GestureDetector(
                                onTap: (){
                                  _controller.jumpToPage(0);
                                  },
                                child: Text('HOME', style: TextStyle(fontSize: 15, color: Colors.white),),
                            ),),
                            SizedBox(width: 30,),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: currentPage == 1 ? Colors.white30: Color(0xFF525252),
                                borderRadius: BorderRadius.circular(19),
                              ),
                              child: GestureDetector(
                                onTap: (){
                                  _controller.jumpToPage(1);
                                },
                                child: Text('FIND LOAD', style: TextStyle(fontSize: 15, color: Colors.white),),
                            ),),
                            SizedBox(width: 30,),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: currentPage == 2 ? Colors.white30: Color(0xFF525252),
                                borderRadius: BorderRadius.circular(19),
                              ),
                              child: GestureDetector(
                                onTap: (){
                                  _controller.jumpToPage(2);
                                },
                                child: Text('TRUCKS', style: TextStyle(fontSize: 15, color: Colors.white),),
                            ),),
                        ],
                      ),
            ),
              ],
                  )
              ),
              Expanded(
                child: PageView(
                  onPageChanged: (val) {
                    if(val != 1){
                    FocusScope.of(context).unfocus();}
                    setState(() {
                      currentPage = val;
                    });
                  },
                  controller: _controller,
                  children: [
                    Scaffold(
                      backgroundColor: Color(0xFFF3F2F1),
                      body: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '           Welcome To \n The Truck Booking App',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Scaffold(
                      backgroundColor: Color(0xFFF3F2F1),
                      body: SafeArea(
                        child: Form(
                          key: formKey,
                          autovalidateMode: AutovalidateMode.always,
                          onChanged: () {
                            Form.of(primaryFocus.context).save();
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0 ),
                                  child: Container(
                                    color: Color(0xFFF3F2F1),
                                    child: ListView(
                                      keyboardDismissBehavior:
                                      ScrollViewKeyboardDismissBehavior.onDrag,
                                      children: [
                                        Container(
                                          height: 72,
                                          width: double.infinity,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  autofocus: true,
                                                  controller: controller1,
                                                  // onFieldSubmitted: (String value) {
                                                  //   loadingPoint = value;
                                                  // },
                                                  onChanged: (newValue) {
                                                    loadingPoint = newValue.trim();
                                                  },
                                                  decoration: InputDecoration(
                                                    hintText: 'Loading Point',
                                                    hintStyle:
                                                    TextStyle(fontSize: 20, color: Colors.grey),
                                                  ),
                                                  // validator: (String value) {
                                                  //   if (value.trim().isEmpty) {
                                                  //     return 'Loading Point is Required';
                                                  //   } else
                                                  //     return null;
                                                  // },
                                                  style:
                                                  TextStyle(fontSize: 20, color: Colors.black),
                                                ),
                                              ),
                                              Container(
                                                child: GestureDetector(onTap:(){setState(() {
                                                  loadingPoint = '';
                                                  controller1 = TextEditingController(text:'');
                                                });} ,child: Icon(Icons.clear,size: 25, color: Colors.black26,)),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: 72,
                                          width: double.infinity,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  controller: controller2,
                                                  autofocus: true,
                                                  onChanged: (newValue) {
                                                    unloadingPoint = newValue.trim();
                                                  },
                                                  decoration: InputDecoration(
                                                    hintText: 'Unloading Point',
                                                    hintStyle:
                                                    TextStyle(fontSize: 20, color: Colors.grey),
                                                  ),
                                                  // validator: (String value) {
                                                  //   if (value.trim().isEmpty) {
                                                  //     return 'Unloading Point is Required';
                                                  //   } else
                                                  //     return null;
                                                  // },
                                                  style:
                                                  TextStyle(fontSize: 20, color: Colors.black),
                                                ),
                                              ),
                                              Container(
                                                child: GestureDetector(onTap:(){setState(() {
                                                  unloadingPoint = '';
                                                  controller2 = TextEditingController(text: '');
                                                });} ,child: Icon(Icons.clear,size: 25, color: Colors.black26,)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Container(
                                          height: 50,
                                          child: FlatButton(
                                            onPressed: () async {
                                              // if (!formKey.currentState.validate()) {
                                              //   return;
                                              // }
                                              if ((loadingPoint == null || loadingPoint.trim() == '') && (unloadingPoint == null || unloadingPoint.trim() == '')){
                                                FocusScope.of(context).unfocus();
                                                showDialog(context: context, builder: (context)=> AlertDialogBox());
                                              }
                                              else{
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=> TsFoundLoadsScreen(searchedLoadingPoint: loadingPoint, searchedUnloadingPoint: unloadingPoint,)));
                                              }},
                                            color: Color(0xFF043979),
                                            child: Text(
                                              'Find',
                                              style: TextStyle(fontSize: 25, color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 15,),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Scaffold(
                      body: ModalProgressHUD(
                        inAsyncCall: showModalProgressHUD,
                        child: Center(
                          child: ListView(
                            children: [
                              GestureDetector(
                                  onTap: ()async{
                                    setState(() {
                                      showModalProgressHUD = true;
                                    });
                                    GpsDataModel gpsData = await getLocationByImei(imei: "355172100788965");
                                    Provider.of<ProviderData>(context,listen: false).updateGpsData(gpsData);
                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>ShowMapWithImei(gpsData: gpsData, userLocation: userLocation,)));
                                    setState(() {
                                      showModalProgressHUD = false;
                                    });
                                  },
                                  child: TruckDetailsCard(imei : "355172100788965", mobileNum: widget.user.phoneNumber)),
                              SizedBox(height: 10,),
                              TruckDetailsCard(imei: "IMEI num", mobileNum: widget.user.phoneNumber,)
                            ],
                          ),
                        ),
                      )
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );


  }


  }



Future<GpsDataModel> getLocationByImei({String imei}) async {
  var jsonData;
  http.Response response = await http.get("http://65.2.59.24:3000/locationbyimei/$imei");
  jsonData = await jsonDecode(response.body);
  print(response.statusCode);
  print(jsonData);
  GpsDataModel gpsDataModel = new GpsDataModel();
  gpsDataModel.imei = jsonData["imei"];
  gpsDataModel.lat = double.parse(jsonData["lat"]);
  gpsDataModel.lng = double.parse(jsonData["lng"]);
  gpsDataModel.speed = jsonData["speed"];
  gpsDataModel.deviceName = jsonData["deviceName"];
  gpsDataModel.powerValue = jsonData["powerValue"];
  return gpsDataModel;
}
