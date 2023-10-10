import 'package:flutter/material.dart';

class SecondAppbar extends StatelessWidget {
  const SecondAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height,
            leading: Icon(Icons.menu),
            title: Text("Arround"),
            flexibleSpace: PageView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Image.network(
                  "https://picsum.photos/id/${index + 50}/200/300",
                  fit: BoxFit.cover,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
