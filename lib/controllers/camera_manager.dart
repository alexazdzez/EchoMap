import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraManager {
  static final CameraManager _instance = CameraManager._internal();
  factory CameraManager() => _instance;
  CameraManager._internal();

  CameraController? controller;
  bool torchOn = false;
  bool initialized = false;

  Future<void> initialize() async {
    if (initialized) return;
    final cameras = await availableCameras();
    controller = CameraController(cameras.first, ResolutionPreset.medium);
    await controller!.initialize();
    initialized = true;
  }

  Future<void> toggleTorch() async {
    if (controller == null) return;
    final mode = torchOn ? FlashMode.off : FlashMode.torch;
    await controller!.setFlashMode(mode);
    torchOn = !torchOn;
  }
}
