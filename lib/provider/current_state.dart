import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';

class CurrentState extends ChangeNotifier {
  DeviceInfo currentDevice = Devices.android.samsungGalaxyA50;

  void changeSelectedDevice(DeviceInfo device) {
    currentDevice = device;
    notifyListeners();
  }
}
