import 'package:caption_craft/login.dart';
import 'package:caption_craft/uploadImage.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
void main() {
  runApp(const MaterialApp(
    title: "Image Remover App",
    home: Welcome(),
  ));
}

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController _pageController = PageController();
  List<String> imagePaths = [
    'lib/assets/1.png',
    'lib/assets/background.png',
    'lib/assets/background.png',
  ];
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Expanded(
            flex: 4,
            child:Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: imagePaths.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
                      child: Image.asset(
                        imagePaths[index],
                        fit: BoxFit.fitHeight,
                      ),
                    );
                  },
                  onPageChanged: (int index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                ),

                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 16,
                  child: DotsIndicator(
                    dotsCount: imagePaths.length,
                    position: _currentPage.toDouble(),
                    decorator: DotsDecorator(
                      color: Color(0xFFBBD1EB33), // Color of inactive dots
                      activeColor: Color(0xFFECF1F7), // Color of active dot
                    ),
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
              ],
            ),),



          Expanded(
            flex: 2,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 32, 0, 8),
                  child: Text(
                    "",
                    style: TextStyle(
                      wordSpacing: 1,
                      height: 20 / 11,
                      color: Color(0xFFA3A9AF),
                      fontWeight: FontWeight.bold,
                      fontFamily: "Mont",
                      fontSize: 11,
                    ),
                  ),
                ),
                const Text(
                  "Welcome",
                  style: TextStyle(
                    height: 1.5,
                    color: Colors.green,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Mont",
                    fontSize: 32,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(24, 8, 23, 24),
                  child: Text(
                    "Welcome to CaptionCraft",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Mont",
                      fontSize: 14,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => const Login(),
                      ),
                      );
                      },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          minimumSize: const Size(80, 44),
                          backgroundColor: const Color(0xFF128F8B), // Set the desired color here
                        ),
                        child: const Text("Login"),
                    ),
                    SizedBox(width: 24),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UploadImage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        minimumSize: const Size(80, 44),
                        backgroundColor: const Color(0xFF128F8B), // Set the desired color here
                      ),
                      child: const Text("Guest"),
                    )

                  ],)
    ]
                )
                ),
              ],
            ),
          );

  }


}