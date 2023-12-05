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

class VersesGetSurahRecitationInitial extends VersesState {}
class VersesGetSurahRecitationSuccess extends VersesState {}
class VersesGetSurahRecitationError extends VersesState {}


class VersesGetAyaRecitationInitial extends VersesState {}
class VersesGetAyaRecitationSuccess extends VersesState {}
class VersesGetAyaRecitationError extends VersesState {}



class VersesPushedPlayAyaButton extends VersesState {}
class VersesReadAya extends VersesState {}
class VersesStopAya extends VersesState {}

class VersesBookMarkAya extends VersesState {}