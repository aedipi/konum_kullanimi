import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  double enlem = 0.0;
  double boylam = 0.0;

  Future<void> konumBilgisiAl() async {
    var konum = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      enlem = konum.latitude;
      boylam = konum.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Konum Kullanımı"),),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("$enlem - $boylam"),
            ElevatedButton(onPressed: (){
              konumBilgisiAl();
            }, child: const Text("Konum Al")),
            //41.0370014,28.9763369,15z
            SizedBox(width: 300,height: 300,
                child: GoogleMap(initialCameraPosition: CameraPosition(target: LatLng(41.0370014, 28.9763369),zoom: 15))
            ),
          ],
        ),
      ),
    );
  }
}
