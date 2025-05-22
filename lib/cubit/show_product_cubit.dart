import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'show_product_state.dart';

class ShowProductCubit extends Cubit<ShowProductState> {
  ShowProductCubit() : super(ShowProductInitial());

  void loadProduct() async {
    try {
      emit(ShowProductLoading());
      // await Future.delayed(Duration(seconds: 1));
      emit(ShowProductLoaded(currentIndex: 0, isFavourite: false, quantityNeed: 1 , isShowDescribe: true));
    } catch (e) {
      emit(ShowProductError(errorMessage: e.toString()));
    }
  }

  void toggleFavourite() {
    if (state is ShowProductLoaded) {
      final current = state as ShowProductLoaded;
      emit(current.copyWith(isFavourite: !current.isFavourite));
    }
  }

  void toggleDescribe() {
    if (state is ShowProductLoaded) {
      final current = state as ShowProductLoaded;
      emit(current.copyWith(isShowDescribe: !current.isShowDescribe));
    }
  }

  void incrementQuantity() {
    if (state is ShowProductLoaded) {
      final current = state as ShowProductLoaded;
      emit(current.copyWith(quantityNeed: current.quantityNeed + 1));
    }
  }

  void decrementQuantity() {
    if (state is ShowProductLoaded) {
      final current = state as ShowProductLoaded;
      emit(current.copyWith(quantityNeed: current.quantityNeed > 1 ? current.quantityNeed - 1 : 1));
    }
  }

  void changeIndexImages(int index) {
    if (state is ShowProductLoaded) {
      final current = state as ShowProductLoaded;
      emit(current.copyWith(currentIndex: index));
    }
  }
}
