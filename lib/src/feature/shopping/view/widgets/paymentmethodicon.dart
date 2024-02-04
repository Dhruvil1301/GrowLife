
import 'package:flutter/material.dart';
import 'package:growlife/src/res/assets.dart';
class AvatarSlider extends StatefulWidget {
  @override
  _AvatarSliderState createState() => _AvatarSliderState();
}

class _AvatarSliderState extends State<AvatarSlider> {
  int _currentIndex = 0;
  late final ValueNotifier<int> _notifier;

  List<String> assetPaths = [
    ShopAssets.phonepay,                               //ITS IS FOR PAYMENT METHOD  PAGE
    ShopAssets.paytm,
    ShopAssets.googlepay,
    // Add more asset paths as needed
  ];

  @override
  void initState() {
    super.initState();
    _notifier = ValueNotifier<int>(_currentIndex);
    _startAutoSlide();
  }

  @override
  void dispose() {
    _notifier.dispose();
    super.dispose();
  }

  void _startAutoSlide() {
    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        _currentIndex = (_currentIndex + 1) % assetPaths.length;
        _notifier.value = _currentIndex;
        _startAutoSlide();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return  ValueListenableBuilder<int>(
      valueListenable: _notifier,
      builder: (context, index, _) {
        return CircleAvatar(
          radius:  MediaQuery.of(context).size.height*.025,
          backgroundColor: Colors.white,
          child: Image(
            image: AssetImage(assetPaths[index]),
            fit: BoxFit.contain, // Choose an appropriate fit option
          ),

        );
      },

    );
  }
}

