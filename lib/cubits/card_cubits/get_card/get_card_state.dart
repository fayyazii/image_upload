part of 'get_card_cubit.dart';


abstract class GetCardState {}

class GetCardInitial extends GetCardState {}
class GetCardLoading extends GetCardState {}
class GetCardLoaded extends GetCardState {
  List<GetCardModel> list = [];
  GetCardLoaded({required this.list});
}
class GetCardError extends GetCardState {
  String err;
  GetCardError({required this.err});
}
