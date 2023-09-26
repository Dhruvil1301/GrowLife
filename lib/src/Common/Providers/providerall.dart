import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:growlife/src/feature/homeview/Navigationobjects/shop/plants.dart';

class NavigationProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int newIndex) {
    _selectedIndex = newIndex;
    notifyListeners();
  }
}

class CustomImageProvider with ChangeNotifier { // Use a different name here
  File? _image;

  File? get image => _image;

  void setImage(File image) {
    _image = image;
    notifyListeners();
  }
}
class BottomNavigationProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void updateIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}


class StarRatingProvider with ChangeNotifier {
  List<bool> _selectedStars = List.generate(5, (index) => false);

  List<bool> get selectedStars => _selectedStars;

  void toggleStar(int index) {
    _selectedStars[index] = !_selectedStars[index];
    notifyListeners();
  }
}
class WishlistProvider extends ChangeNotifier {
  List<ShopItem> _wishlistItems = [];

  List<ShopItem> get wishlistItems => _wishlistItems;

  void addToWishlist(ShopItem item) {
    _wishlistItems.add(item);
    notifyListeners();
  }
  void removeFromWishlist(ShopItem item) {
    _wishlistItems.remove(item);
    notifyListeners();
  }
}
class CameraProvider extends ChangeNotifier {
  late CameraController _controller;
  late List<CameraDescription> cameras;

  CameraController get controller => _controller;

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      _controller = CameraController(cameras[0], ResolutionPreset.medium);
      await _controller.initialize();
      notifyListeners();
    }
  }

  Future<void> takePicture() async {
    if (_controller != null && _controller.value.isInitialized && !_controller.value.isTakingPicture) {
      try {
        final XFile picture = await _controller.takePicture();
        // Handle the captured picture as needed
        print('Picture taken: ${picture.path}');
      } catch (e) {
        print('Error taking picture: $e');
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
class VideoProvider extends ChangeNotifier {
  File? _selectedVideo;
  File? get selectedVideo => _selectedVideo;

  void setSelectedVideo(File video) {
    _selectedVideo = video;
    notifyListeners();
  }
}
class MyNavigatorObserver extends NavigatorObserver {
  final List<PageRoute<dynamic>> _history = [];

  bool onWillPop() {
    if (_history.isNotEmpty) {
      final route = _history.removeLast();
      route.navigator?.removeRoute(route);
      return false; // Prevent going back
    }
    return true; // Allow going back to the previous screen
  }

  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route is PageRoute) {
      _history.add(route);
    }
  }
}
class DoubleClickToExitApp extends StatefulWidget {
  final Widget child;

  DoubleClickToExitApp({required this.child});

  @override
  _DoubleClickToExitAppState createState() => _DoubleClickToExitAppState();
}

class _DoubleClickToExitAppState extends State<DoubleClickToExitApp> {
  bool _isExitClicked = false;
  late DateTime _currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: widget.child,
    );
  }

  Future<bool> _onWillPop() async {
    if (_isExitClicked) {
      // If the back button is pressed again within 2 seconds, exit the app.
      return true;
    }

    // First click on back button.
    if (_currentBackPressTime == null ||
        DateTime.now().difference(_currentBackPressTime) > Duration(seconds: 2)) {
      // Show a snackbar to inform the user to double-click to exit.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Press back again to exit.'),
          duration: Duration(seconds: 2),
        ),
      );

      // Set the current time to track the time between back button presses.
      _currentBackPressTime = DateTime.now();
      return false;
    }

    // Second click on back button within 2 seconds, exit the app.
    _isExitClicked = true;
    return true;
  }
}
class DashboardNavigationProvider with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}