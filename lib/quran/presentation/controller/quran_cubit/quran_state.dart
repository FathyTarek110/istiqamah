part of 'quran_cubit.dart';

@immutable
abstract class QuranState {}

class QuranInitial extends QuranState {}
class QuranUpdateBookMark extends QuranState {}
class QuranScrollControllerInitial extends QuranState {}
class QuranGetChaptersInitial extends QuranState {}
class QuranGetChaptersSuccess extends QuranState {}
class QuranGetChaptersError extends QuranState {}
class QuranGetBookMarkSuccess extends QuranState {}
