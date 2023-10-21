import 'package:flutter/material.dart';

class FirstAppbar extends StatelessWidget {
  const FirstAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true, // snap과 세트
            snap: true,
            pinned: false,
            title: Text("appbar2", style: TextStyle(color: Colors.white)),
            expandedHeight: 250,
            flexibleSpace: Container(
              child: Image.network(
                "https://picsum.photos/200/300",
                fit: BoxFit.cover,
              ),
            ),
            elevation: 0,
          ),
          SliverPersistentHeader(
            pinned: true,
            floating: false,
            delegate: MySliverPersistentHeaderDelegate(
              minHeight: 50.0,
              maxHeight: 120.0,
              child: Container(
                color: Colors.blue[300],
                child: const Center(
                  child: Text(
                    'SliverPersistentHeader',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          SliverAppBar(
            pinned: true,
            title: Text("appbar1", style: TextStyle(color: Colors.white)),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 20,
              (context, index) => ListTile(
                leading: Icon(Icons.person),
                title: Text("$index"),
                trailing: Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  MySliverPersistentHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant MySliverPersistentHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}
