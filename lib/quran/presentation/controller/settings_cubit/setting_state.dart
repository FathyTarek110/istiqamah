part of 'setting_cubit.dart';

@immutable
abstract class SettingState {}

class SettingInitial extends SettingState {}
class SettingChooseRecitation extends SettingState {}
class SettingChangeMode extends SettingState {}