import 'package:bookia1/feature/home/data/model/bestseller_respons/bestseller_respons.dart';
import 'package:bookia1/feature/home/data/model/slider_rospons/slider_rospons.dart';
import 'package:bookia1/feature/home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'homecubit_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  BestsellerRespons? BestSellerRespons;
  BestsellerRespons? AllProdact;
  SliderRospons? sliderRospons;

  Future<void> getBestSeller() async {
    emit(BestsellerLoading());
    await Homerepo.getBestSeller().then((value) {
      if (value != null) {
        BestSellerRespons = value;
        emit(BestsellerLoaded());
      } else {
        emit(BestsellerError("error"));
      }
    });
  }

  Future<void> getslider() async {
    emit(sliderLoading());
    await Homerepo.getslider().then((value) {
      if (value != null) {
        sliderRospons = value;
        emit(sliderLoaded());
      } else {
        emit(sliderError("error"));
      }
    });
  }

  Future<void> addtowishlist(int productid) async {
    emit(addWishlistcartLoading());
    await Homerepo.addtowishlist(productid).then((value) {
      if (value != null) {
        emit(addWishlistcartLoaded("Added To Wishlist"));
      } else {
        emit(addWishlistcartError("error"));
      }
    });
  }

  Future<void> addtocart(int productid) async {
    emit(addWishlistcartLoading());
    await Homerepo.addtocart(productid).then((value) {
      if (value != null) {
        emit(addWishlistcartLoaded("Added To Cart"));
      } else {
        emit(addWishlistcartError("error"));
      }
    });
  }

  Future<void> getAllProdact() async {
    emit(AllprodactLoading());
    await Homerepo.getAllProdact().then((value) {
      if (value != null) {
        AllProdact = value;
        emit(AllprodactLoaded());
      } else {
        emit(AllprodactError("error"));
      }
    });
  }
}
