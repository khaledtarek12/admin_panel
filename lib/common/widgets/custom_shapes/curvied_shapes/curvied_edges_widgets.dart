import 'package:flutter/material.dart';
import 'package:t_store_web_adimn/common/widgets/custom_shapes/curvied_shapes/curvied_edges.dart';

class TCurvedEdgeWdget extends StatelessWidget {
  const TCurvedEdgeWdget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: TCustomCurviedEdges(), child: child);
  }
}
