import 'package:amap_flutter_location/amap_flutter_location.dart';

class AMap {
  AMap() {
    print('地图');
    // AMapFlutterLocation.updatePrivacyShow(true, true);
    // AMapFlutterLocation.updatePrivacyAgree(true);
    AMapFlutterLocation.setApiKey('androidKey', 'bd6787091306c9f72924903ba271333f');
  }
}
