import 'package:flutter/material.dart';

class MyThirdSliver extends StatelessWidget {
  const MyThirdSliver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          title: Text("SliverAppb22ar"),
          expandedHeight: 300,
          toolbarHeight: 30,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              "https://picsum.photos/200/300",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 500,
            color: Colors.red,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 5,
            (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(height: 100, color: Colors.blue, child: Text("$index")),
              );
            },
          ),
        ),
        // 수평 스크롤 가능한 ListView
        SliverToBoxAdapter(
          child: SizedBox(
            height: 150, // ListView의 높이 설정
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // 수평 스크롤 설정
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 100,
                  color: Colors.green,
                  alignment: Alignment.center,
                  child: Text("Horizontal Item $index"),
                );
              },
            ),
          ),
        ),
        SliverFillViewport(
          delegate: SliverChildBuilderDelegate(
            childCount: 5,
            (context, index) {
              return Card(
                child: Container(
                  child: Text("Fill ViewPort Item $index"),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
