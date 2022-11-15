import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pagination/states/cubit_state.dart';

import '../services/data_service.dart';

class PhotoCubit extends Cubit<CubitState> {
  late int mPage = 0;
  late int mRetryValue = 0;

  final DataService dataService = DataService();

  PhotoCubit()
      : super(CubitState(
          isFirstLoading: false,
          isLoading: false,
          exception: '',
          result: [],
        ));

  bool isFirstPage() {
    return mPage == 1;
  }

  void reload() {
    _loadData(true);
  }

  void loadFirst() {
    mPage = 1;
    _loadData(true);
  }

  void loadNext() {
    ++mPage;
    _loadData();
  }

  Future<void> _loadData([bool isReloading = false]) async {
    final loadingState = state.copyWith(
      isFirstLoading: isReloading || isFirstPage(),
      isLoading: true,
    );

    emit(loadingState);

    try {
      final data = await dataService.getPhotosByPage(mPage);

      final currentData = state.result;

      currentData.addAll(data);

      final loadedState = state.copyWith(
        isFirstLoading: false,
        isLoading: false,
        result: currentData,
      );

      print(loadedState);

      emit(loadedState);
    } catch (e) {
      final error = e.toString();

      final failedState = state.copyWith(
        isFirstLoading: false,
        isLoading: false,
        exception: error,
      );

      emit(failedState);
    }
  }
}
