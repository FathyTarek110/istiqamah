part of 'verses_cubit.dart';

@immutable
abstract class VersesState {}

class VersesInitial extends VersesState {}

class VersesScrollControllerInitial extends VersesState {}

class VersesGetSurahInitial extends VersesState {}
class VersesGetSurahSuccess extends VersesState {}
class VersesGetSurahError extends VersesState {}

class VersesGetSurahTranslationInitial extends VersesState {}
class VersesGetSurahTranslationSuccess extends VersesState {}
class VersesGetSurahTranslationError extends VersesState {}