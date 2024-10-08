import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MyAbout extends StatefulWidget {
  const MyAbout({super.key});

  @override
  State<MyAbout> createState() => _MyAboutState();
}

class _MyAboutState extends State<MyAbout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 60),
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
                  top: MediaQuery.of(context).size.height * 0.60),
              child: Column(
                children: [
                  Text(
                    'Hello I am',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
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
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 150,
                    child: TextButton(
                      onPressed: () async {
                        final Uri emailLaunchUri = Uri(
                            scheme: 'mailto',
                            path: 'ronitroshan2003@gmail.com');

                        try {
                          await launchUrl(emailLaunchUri);
                        } catch (e) {
                          print('Could not launch $emailLaunchUri: $e');
                        }
                      },
                      child: Text(
                        'Hire Me',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(131, 800, 131, 20),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () async {
                        var url = Uri.https(
                          "www.instagram.com",
                          "/ronitroshannayak",
                        );
                        launchUrl(url);
                        if (await canLaunchUrl(url)) {
                          launchUrl(url);
                        }
                      },
                      icon: Icon(
                        FontAwesomeIcons.instagram,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () async {
                        var url = Uri.https(
                          "github.com",
                          "/Cadosfrit",
                        );
                        launchUrl(url);
                        if (await canLaunchUrl(url)) {
                          launchUrl(url);
                        }
                      },
                      icon: Icon(
                        FontAwesomeIcons.git,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () async {
                        var url = Uri.https(
                          "www.linkedin.com",
                          "/in/ronit-roshan-nayak-8ab4232bb/",
                        );
                        launchUrl(url);
                        if (await canLaunchUrl(url)) {
                          launchUrl(url);
                        }
                      },
                      icon: Icon(
                        FontAwesomeIcons.linkedin,
                        color: Colors.white,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
