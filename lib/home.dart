import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sliding_sheet2/sliding_sheet2.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  myAchieve(num, type) {
    return Row(
      children: [
        Text(
          num,
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        Container(
            margin: EdgeInsets.only(top: 7.5),
            child: Text(
              type,
              style: TextStyle(fontSize: 13),
            ))
      ],
    );
  }

  mySpec(icon, tech) {
    return Container(
        width: 115,
        height: 115,
        child: Card(
          elevation: 20,
          margin: EdgeInsets.all(0),
          color: Color(0xff252525),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  tech,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: PopupMenuButton(
          color: Color(0xff262628),
          icon: Icon(Icons.menu),
          iconColor: Colors.white,
          itemBuilder: (context) => [
            PopupMenuItem(
                child: TextButton(
                  child: Text(
                    'Projects',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'project');
                  },
                ),
                value: 2),
            PopupMenuItem(
              child: TextButton(
                child: Text('About Me', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.pushNamed(context, 'about');
                },
              ),
              value: 2,
            )
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SlidingSheet(
        elevation: 8,
        cornerRadius: 50,
        snapSpec: const SnapSpec(
          // Enable snapping. This is true by default.
          snap: true,
          // Set custom snapping points.
          snappings: [0.38, 0.7, 1.0],
          // Define to what the snappings relate to. In this case,
          // the total available space that the sheet can expand to.
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        // The body widget will be displayed under the SlidingSheet
        // and a parallax effect can be applied to it.
        body: Container(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 35),
                child: ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
                              begin: Alignment.center,
                              end: Alignment.bottomCenter,
                              colors: [Colors.black, Colors.transparent])
                          .createShader(
                              Rect.fromLTRB(0, 0, rect.width, rect.height));
                    },
                    blendMode: BlendMode.dstIn,
                    child: Image.asset(
                      'lib/assets/imgr.png',
                      height: 500,
                      fit: BoxFit.contain,
                    )),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.49),
                child: Column(
                  children: [
                    Text(
                      'Ronit Roshan Nayak',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text('Software Engineer',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              )
            ],
          ),
        ),
        builder: (context, state) {
          // This is the content of the sheet that will get
          // scrolled, if the content is bigger than the available
          // height of the sheet.
          return Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 30),
              height: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      myAchieve('66', 'Projects'),
                      myAchieve('10', 'Clients'),
                      myAchieve('23', 'Certifications')
                    ],
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  Text(
                    'Specialized In',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          mySpec(Icons.android, 'Android'),
                          mySpec(Icons.apple, 'IOS'),
                          mySpec(Icons.html, 'HTML')
                        ],
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          mySpec(Icons.css, 'CSS'),
                          mySpec(Icons.javascript, 'JavaScript'),
                          mySpec(Icons.discord, 'Discord')
                        ],
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          mySpec(Icons.php, 'PHP'),
                          mySpec(Icons.laptop_chromebook, 'Software\nEngineer'),
                          mySpec(Icons.window, 'Windows')
                        ],
                      ),
                    ],
                  )
                ],
              ));
        },
      ),
    );
  }
}
