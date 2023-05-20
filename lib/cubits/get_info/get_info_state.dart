part of 'get_info_cubit.dart';


abstract class GetInfoState {}

class GetInfoInitial extends GetInfoState {}
class GetInfoLoading extends GetInfoState {}
class GetInfoLoaded extends GetInfoState {
  List<GetInfoModel> list ;
  GetInfoLoaded({required this.list});
}
class GetInfoError extends GetInfoState {
  String err;
  GetInfoError({required this.err});
}
