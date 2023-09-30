import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:frontend/ui/common_widgets/form_components.dart';
import 'package:frontend/ui/common_widgets/grid_background.dart';
import 'package:frontend/ui/common_widgets/wrapper.dart';
import 'package:frontend/ui/dashboard/spaces_grid.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Wrapper(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: DottedBackgroundPainter(),
          child: Padding(
            padding: const EdgeInsets.only(left: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CoreComponents.header("Your Spaces", size),
                CoreComponents.middleSpace(size),
                SpacesGrid(spaces: [1, 2, 3, 4, 5, 6, 6, 7]),
                CoreComponents.middleSpace(size)
              ],
            ),
          ),
        ),
      ),
      authSession: (session) {},
    );
  }
}
