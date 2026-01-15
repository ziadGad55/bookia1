import 'package:bookia1/feature/cart/data/model/cartrespons/cartrespons.dart';
import 'package:bookia1/feature/cart/data/model/checkout/checkout.dart';
import 'package:bookia1/feature/cart/data/repo/cart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cartcubit_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  Cartrespons? cartrespons;

  checkoutrespons? checkoutResponses;

  Future<void> getcart() async {
    emit(CartLoading());
    await cartRepo.getcart().then((value) {
      if (value != null) {
        cartrespons = value;
        emit(CartLoaded());
      } else {
        emit(CartError('error'));
      }
    });
  }

  Future<void> updatecart(int cartitemid, int quantity) async {
    emit(CartLoading());
    await cartRepo.updatecart(cartitemid, quantity).then((value) {
      if (value != null) {
        cartrespons = value;
        emit(CartLoaded());
      } else {
        emit(CartError('error'));
      }
    });
  }

  Future<void> removefromcart(int cartitemid) async {
    emit(CartLoading());
    await cartRepo.removefromcart(cartitemid).then((value) {
      if (value != null) {
        cartrespons = value;
        emit(CartLoaded());
      } else {
        emit(CartError('error'));
      }
    });
  }

  Future<void> Checkout() async {
    emit(CheckoutLoading());
    await cartRepo.checkout().then((value) {
      if (value != null) {
        emit(CheckoutLoaded((value.data?.total ?? 0).toString()));
      } else {
        emit(CartError('error'));
      }
    });
  }
}
