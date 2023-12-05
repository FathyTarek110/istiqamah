part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterChooseRecitation extends RegisterState {}
class RegisterChooseTranslation extends RegisterState {}
class RegisterChangeMode extends RegisterState {}