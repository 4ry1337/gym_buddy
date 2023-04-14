import 'package:get/get.dart';
import 'package:gym_buddy/Repository/Model/language.model.dart';

class Translation extends Translations {
  static final List<LanguageModel> languages = [
    LanguageModel(0, "English", "en", "US"),
    LanguageModel(1, "Русский", "ru", "RU"),
  ];
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'title': 'Title',
      'name': 'Name',
      'validateTitle': 'Required',
      'description': 'Description',
      'validateDescription': 'Required',
      'week': 'Week',
      'month': 'Month',
      'common':'Common',
      'language':'Language',
      'ok': 'Ok',
      'create': 'Create',
      'edit': 'Edit',
      'cancel': 'Cancel',
      'delete': 'Delete',
      'error': 'Error'
    },
    'ru_RU': {
      'title': 'Заголовок',
      'name': 'Название',
      'validateTitle': 'Обязательно',
      'description': 'Описание',
      'validateDescription': 'Обязательно',
      'week': 'Неделя',
      'month': 'Месяц',
      'common':'Общие',
      'language':'Язык',
      'ok': 'Oк',
      'create': 'Создать',
      'edit': 'Изменить',
      'cancel': 'Отмена',
      'delete': 'Удалить',
      'error': 'Ошибка'
    },
  };
}
