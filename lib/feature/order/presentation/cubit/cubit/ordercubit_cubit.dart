import 'package:bloc/bloc.dart';

part 'ordercubit_state.dart';

class OrdercubitCubit extends Cubit<OrdercubitState> {
  OrdercubitCubit() : super(OrdercubitInitial());
}
