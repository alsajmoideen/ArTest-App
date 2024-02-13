import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector64;

class ArShape extends StatefulWidget {
  const ArShape({super.key});

  @override
  State<ArShape> createState() => _ArShapeState();
}

class _ArShapeState extends State<ArShape> {
  ArCoreController? arcoreController;

  argumentRealityViewCreated(ArCoreController coreController) {
    arcoreController = coreController;
    displayCube(coreController);
    displayCylinder(coreController);
  }

  displayCube(ArCoreController controller) {
    final materials = ArCoreMaterial(
      color: Colors.red,
      metallic: 2,
    );
    final cube = ArCoreCube(
      size: vector64.Vector3(0.5, 0.5, 0.5),
      materials: [materials],
    );
    final node = ArCoreNode(
      shape: cube,
      position: vector64.Vector3(-0.5, 0.5, -3.5),
    );
    arcoreController!.addArCoreNode(node);
  }

  displayCylinder(ArCoreController controller) {
    final materials = ArCoreMaterial(
      color: Colors.greenAccent,
      metallic: 2,
    );
    final cylinder = ArCoreCylinder(
      height: 1.0,
      radius: 0.8,
      materials: [materials],
    );
    final node = ArCoreNode(
      shape: cylinder,
      position: vector64.Vector3(0.2, 0.5, -3.5),
    );
    arcoreController!.addArCoreNode(node);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AR APP"),
        centerTitle: true,
      ),
      body: ArCoreView(
        onArCoreViewCreated: argumentRealityViewCreated,
      ),
    );
  }
}
