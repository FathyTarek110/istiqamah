import 'package:istiqamah/quran/domain/entity/chapter/chapter.dart';

import '../../domain/entity/chapters/chapters.dart';

class ChaptersModel extends Chapters{
  ChaptersModel(super.chapters);

  factory ChaptersModel.fromJson(Map<String,dynamic> json){
    return ChaptersModel(json['chapters']);
  }

}