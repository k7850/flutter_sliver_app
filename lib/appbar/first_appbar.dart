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
