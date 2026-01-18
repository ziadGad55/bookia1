import 'package:bookia1/feature/order/data/model/OrderRequest/Order_params.dart';
import 'package:bookia1/feature/order/data/model/OrderRespons/order_respons/order_respons.dart';
import 'package:bookia1/feature/order/data/model/governorates/governorates.dart';
import 'package:bookia1/feature/order/data/repo/order_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ordercubit_state.dart';

class OrdercubitCubit extends Cubit<OrdercubitState> {
  OrdercubitCubit() : super(OrdercubitInitial());

  Governorates? governorates;
  OrderRespons? orderRespons;

  Future<void> getgovernorates() async {
    emit(OrderLoading());
    await OrderRepo.getgovernorates().then((value) {
      if (value != null) {
        governorates = value;
        emit(OrderLoaded());
      } else {
        emit(OrderError('error'));
      }
    });
  }

  Future<void> SubmitOrder(
    OrderParams params,
  ) async {
    emit(Ordersubmitloading());
    await OrderRepo.Submit_Order(params).then((value) {
      if (value != null) {
        orderRespons = value;
        emit(OrdersubmitLoaded());
      } else {
        emit(OrdersubmitError('error'));
      }
    });
  }
}
