import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _controller = ScrollController();

  double prev = 0;
  double height = 300;
  double profileOpacity = 1.0; // 프로필 컨테이너의 투명도

  @override
  void initState() {
    _controller.addListener(() {
      scrollListener();
    });
    super.initState();
  }

  // 오프셋을 계산하려면 이전 오프셋 값을 알아야함(prev)
  void scrollListener() {
    print("스크롤 동작중");
    double currentOffset = _controller.offset;
    print("currentOffset : $currentOffset");

    setState(() {
      // 오프셋0 일때 최대화면, 투명도 1
      if (currentOffset <= 0) {
        profileOpacity = 1.0;
      }
      // 화면에서 사라짐 투명도 0
      else if (currentOffset >= 300) {
        profileOpacity = 0.0;
      }
      // 나머지 투명도 조절
      else {
        profileOpacity = 1.0 - (currentOffset / 300);
      }
    });

    // 실습 : 오프셋이 300보다 작을때만 동작
    // setState로 flexibleSpace를 구현해보기
    // 0 ~ 300
    if (currentOffset < 300) {
      setState(() {
        height = 300 - currentOffset - 56;
        if (height < 0) {
          height = 0;
        }
      });
    }

    // 301            300 -> 아래 방향
    if (currentOffset > prev) {
      print("아래로 내려가요");
    }

    // 300            301 -> 윗 방향
    if (currentOffset < prev) {
      print("위로 올라가요");
    }

    if (currentOffset == _controller.position.maxScrollExtent) {
      print("최하단");
      setState(() {
        // height = 0;
      });
    }

    // currentOffset = 0;
    if (currentOffset == _controller.position.minScrollExtent) {
      print("최상단");
    }

    prev = currentOffset;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Opacity(
              opacity: profileOpacity,
              child: Container(
                color: Colors.red,
                height: height,
                width: double.infinity,
                child: Center(
                  child: Text(
                    "프로필",
                    style: TextStyle(color: Colors.white, fontSize: profileOpacity * 50),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: _controller,
                itemCount: 50,
                itemBuilder: (context, index) => Text("제목 $index"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
