part of 'show_product_cubit.dart';

@immutable
abstract class ShowProductState {}

class ShowProductInitial extends ShowProductState {}

class ShowProductLoading extends ShowProductState {}

class ShowProductLoaded extends ShowProductState {
  final int currentIndex;
  final bool isFavourite;
  final int quantityNeed;
  final bool isShowDescribe;

  ShowProductLoaded({
    required this.currentIndex,
    required this.isFavourite,
    required this.quantityNeed,
    required this.isShowDescribe,
  });

  ShowProductLoaded copyWith({
    int? currentIndex,
    bool? isFavourite,
    int? quantityNeed,
    bool? isShowDescribe,
  }) {
    return ShowProductLoaded(
      currentIndex: currentIndex ?? this.currentIndex,
      isFavourite: isFavourite ?? this.isFavourite,
      quantityNeed: quantityNeed ?? this.quantityNeed,
      isShowDescribe: isShowDescribe ?? this.isShowDescribe,
    );
  }
}

class ShowProductError extends ShowProductState {
  final String errorMessage;

  ShowProductError({required this.errorMessage});
}
