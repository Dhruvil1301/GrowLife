import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:growlife/src/Models/all_user_model.dart';
import 'package:growlife/src/feature/alluser/repo/all_user_repo.dart';



class AllUserDataController extends StateNotifier<List<AllUserData>> {
  AllUserDataController() : super([]);
  final _repository = AllUserDataRepository();
  int _page = 1;
  bool _hasMoreData = true;

  bool get hasMoreData => _hasMoreData;

  Future<void> fetchData() async {
    if (!_hasMoreData) return;

    try {
      final userData = await _repository.fetchUserData(_page);
      if (userData.isNotEmpty) {
        state = [...state, ...userData];
        _page++;
      } else {
        _hasMoreData = false;
      }
    } catch (error) {
      print('Error fetching user data: $error');
    }
  }
}
