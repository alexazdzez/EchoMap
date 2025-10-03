import 'package:flutter/material.dart';
import '../controllers/camera_manager.dart';
import 'package:camera/camera.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});
  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final CameraManager camMgr = CameraManager();

  @override
  void initState() {
    super.initState();
    camMgr.initialize().then((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final controller = camMgr.controller;
    if (controller == null || !controller.value.isInitialized) {
      return Container(color: Colors.black); // pas de flash rouge
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        CameraPreview(controller),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 30,
            color: Colors.white.withOpacity(0.5),
          ),
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: FloatingActionButton(
            onPressed: () async {
              await camMgr.toggleTorch();
              setState(() {});
            },
            backgroundColor: camMgr.torchOn ? Colors.yellow : Colors.grey,
            child: Icon(camMgr.torchOn ? Icons.flash_on : Icons.flash_off),
          ),
        ),
      ],
    );
  }
}
