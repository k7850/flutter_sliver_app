import 'package:flutter/material.dart';

class ThirdAppbar extends StatelessWidget {
  const ThirdAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  "https://picsum.photos/id/${index + 25}/200/300",
                ),
                fit: BoxFit.cover),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text("Arround"),
              leading: Icon(Icons.menu),
            ),
            body: Center(
              child: Text("Page $index", style: TextStyle(fontSize: 50)),
            ),
          ),
        );
      },
    );
  }
}
