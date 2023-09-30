import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SpacesGrid extends StatefulWidget {
  final List<int> spaces;
  const SpacesGrid({super.key, required this.spaces});

  @override
  State<SpacesGrid> createState() => _SpacesGridState();
}

class _SpacesGridState extends State<SpacesGrid> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Row>>(
        future: _buildGrid(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: snapshot.data!,
            );
          } else {
            return Shimmer.fromColors(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _spacesCard(),
                  _spacesCard(),
                  _spacesCard(),
                  _spacesCard(),
                  _spacesCard(),
                  _spacesCard(),
                ],
              ),
              baseColor: Theme.of(context).colorScheme.surface,
              highlightColor: Theme.of(context).colorScheme.surfaceVariant,
            );
          }
        });
  }

  Future<List<Row>> _buildGrid() async {
    List<Row> rows = [];
    List<Widget> temp = [];
    for (int i = 1; i <= widget.spaces.length; i++) {
      temp.add(_spacesCard());
      if (i % 6 == 0) {
        rows.add(Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: temp,
        ));
        temp = [];
      }
    }
    rows.add(Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: temp,
    ));
    await Future.delayed(const Duration(seconds: 2));
    return rows;
  }

  Card _spacesCard() {
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: SizedBox(
        width: size.width * 0.15,
        height: size.height * 0.15,
        child: Center(child: Text('Filled Card')),
      ),
    );
  }
}
