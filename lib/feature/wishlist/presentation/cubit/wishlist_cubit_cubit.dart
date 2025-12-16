import 'package:bookia1/feature/wishlist/data/model/wishlistrespons/wishlistrespons.dart';
import 'package:bookia1/feature/wishlist/data/repo/wishlist_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wishlist_cubit_state.dart';

class WishlistCubit extends Cubit<WishlistCubitState> {
  WishlistCubit() : super(WishlistCubitInitial());

  Wishlistrespons? wishlistrespons;

  getWishlist() async {
    emit(WishlistCubitLoading());
    await WishlistRepo.getWishlist().then((value) {
      if (value != null) {
        wishlistrespons = value;
        emit(WishlistCubitSuccess());
      } else {
        emit(WishlistCubitError("Failed to load wishlist"));
      }
    });
  }

  Future<void> removeFromWishlist(int productId) async {
    emit(WishlistCubitLoading());
    await WishlistRepo.removefromwishlist(productId).then((value) {
      if (value != null) {
        wishlistrespons = value;
        emit(WishlistCubitSuccess());
      } else {
        emit(WishlistCubitError("Failed to remove from wishlist"));
      }
    });
  }


  Future<void> addtocart(int productid) async {
    emit(cartCubitLoading());
    await WishlistRepo.addtocart(productid).then((value) {
      if (value != null) {
        emit((cartCubitSuccess()));
      } else {
        emit(cartCubitError("error"));
      }
    });
  }
}
