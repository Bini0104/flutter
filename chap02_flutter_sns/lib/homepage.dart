import 'package:chap02_flutter_sns/feedlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      "https://gratisography.com/wp-content/uploads/2024/01/gratisography-cyber-kitty-1170x780.jpg",
      "https://gratisography.com/wp-content/uploads/2023/10/gratisography-cool-cat-1170x780.jpg",
      "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzEyMDZfMTA5%2FMDAxNzAxODMyNjM2NTcz.oq6RQHxEFosc_CDVk85pewvlStVbuE-897AGuAECzbkg.wk6LSBUUWqZr2DCp6BFhAlD6831GPHIdjgXPV_YAXn4g.GIF.rlqhstyle%2Fpublic_%25A3%25A88%25A3%25A9.gif&type=sc960_832_gif",
      "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTAxMTlfNTQg%2FMDAxNjExMDY2ODIwNzQw.Ga14IDI2C0kT2y54prGriIe319gZ6Bw5MZMNE13XBP0g.QO2JPmsJmgA_L85JDJG59AlN8jMTtmH_PaUI_AMzRx0g.GIF.hr58113%2FIMG_6952.GIF&type=sc960_832_gif",
      "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTAyMjFfMTk2%2FMDAxNjEzODYzMTU1MzYy.l6vyaHZmYn75DyGqPEWOp_ubpkPqdP9UAWfhEuBvIKsg.YsomwsvRK4XhU04q25VbPlKMVwLcSttKI1o6Z7_wgm0g.GIF.enqntkfkd9%2FKakaoTalk_20210221_081658714_01.gif&type=sc960_832_gif",
      "https://search.pstatic.net/sunny/?src=http%3A%2F%2Ffile3.instiz.net%2Fdata%2Ffile3%2F2021%2F06%2F23%2F9%2Ff%2F3%2F9f3a527e1deaf615984516626d24dccd.gif&type=sc960_832_gif",
      "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMDEyMjFfMTMz%2FMDAxNjA4NTMyNzA0NjI4.0YIWG6K2zUywS-JIQtRmMS6QnI9icP5nE8mWY52jdcQg.s9ZA1BzO9zz6cX1qppdNnJ1WuxWrzfwjkkCZqOHjp-Qg.GIF.vkfvkfdl27%2FIMG_0390.GIF&type=sc960_832_gif",
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.camera),
          onPressed: () {},
        ),
        actions: [
          IconButton(icon: Icon(CupertinoIcons.paperplane), onPressed: () {})
        ],
        title: Image.asset(
          'assets/images/og_logo.png',
          height: 32,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          String image = images[index];
          return FeedList(
            imageUrl: image,
          );
        },
      ),
    );
  }
}
