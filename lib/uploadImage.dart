import 'dart:io';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:carousel_slider/carousel_slider.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({Key? key}) : super(key: key);

  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  ImagePicker imagePicker = ImagePicker();
  List<String> imagePaths = [];
  PageController _pageController = PageController();
  int _currentPage = 0;

  Future<void> _pickImages() async {
    final selectedImages = await imagePicker.pickMultiImage();

    if (selectedImages.isNotEmpty) {
      setState(() {
        imagePaths = selectedImages.map((media) => media.path).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Color(0xFFFFFFFF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Expanded(
            flex: 2,
            child: Container(
            ),
          ),
          imagePaths.isNotEmpty
              ? Expanded(
            flex: 2,
            child: Stack(

              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: imagePaths.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(80)),
                      child: Image.file(
                        File(imagePaths[index]),
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
                      color: Color(0xFF128F8B), // Color of inactive dots
                      activeColor: Color(0xFFECF1F7), // Color of active dot
                    ),
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
              ],
            ),
          )
              : Container(
            height: 200.0,
            color: Colors.grey[300],
            alignment: Alignment.center,
            child: Text('No images selected'),
          ),
          SizedBox(height: 20),
          Expanded(
            flex: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _pickImages,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    minimumSize: const Size(150, 50),
                    backgroundColor: const Color(0xFF1D4048), // Set the desired color here
                  ),
                  child: Text('Select Images'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _pickImages,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    minimumSize: const Size(150, 50),
                    backgroundColor: const Color(0xFF1D4048), // Set the desired color here
                  ),
                  child: Text('Generate Description'),
                ),
              ],
            )),

          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: Colors.black),
                ),
                padding: EdgeInsets.all(32.0),
                child: Text(
                  'Exclusive Posturepedic technology delivers stable and conforming support, emphasizing reinforced support under the heaviest parts of the body. The Performance Collection features overall durability and support, including Ultra stretch Comfort Loft cover with moisture protection for a comfortable night\'s sleep.',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          )
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: UploadImage(),
  ));
}
