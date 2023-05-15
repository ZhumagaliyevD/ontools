import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ru'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? ruText = '',
  }) =>
      [enText, ruText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // EntryPage
  {
    'fyazpbhv': {
      'en': 'Войдите в аккаунт',
      'ru': '',
    },
    '4ekpjqof': {
      'en': 'Email',
      'ru': '',
    },
    'o7jcjsy6': {
      'en': 'name@example.com',
      'ru': '',
    },
    'u609mfdg': {
      'en': 'Введите пароль',
      'ru': '',
    },
    'i3z15n6q': {
      'en': 'Забыл пароль? ',
      'ru': '',
    },
    '1jxfx2lq': {
      'en': 'Войти',
      'ru': '',
    },
    'tzr2l9ls': {
      'en': 'У Вас нет аккаунта? Зарегистрируйтесь',
      'ru': '',
    },
    'wjath1cn': {
      'en': 'или',
      'ru': '',
    },
    '0comobkd': {
      'en': 'Home',
      'ru': '',
    },
  },
  // PhoneEntryPage
  {
    'wntye8w7': {
      'en': 'Войдите в аккаунт',
      'ru': '',
    },
    'rvdy4sf4': {
      'en': 'Мобильный телефон',
      'ru': '',
    },
    'fgr0q7m2': {
      'en': '+7 000 00 00',
      'ru': '',
    },
    'g8tzuvhn': {
      'en': 'Забыл пароль? ',
      'ru': '',
    },
    '6i3kuguf': {
      'en': 'Войти',
      'ru': '',
    },
    'nwev13s8': {
      'en': 'У Вас нет аккаунта? Зарегистрируйтесь',
      'ru': '',
    },
    '92p8yua0': {
      'en': 'или',
      'ru': '',
    },
    '6m3jy26v': {
      'en': 'Home',
      'ru': '',
    },
  },
  // PhoneVerify
  {
    'pit5diz7': {
      'en': 'Введите код из SMS',
      'ru': '',
    },
    'x7dtoc0g': {
      'en': 'Войти',
      'ru': '',
    },
    'ozvnoawc': {
      'en': 'У Вас нет аккаунта? Зарегистрируйтесь',
      'ru': '',
    },
    'gkx5k2w7': {
      'en': 'или',
      'ru': '',
    },
    'qj9m7wk3': {
      'en': 'Home',
      'ru': '',
    },
  },
  // SignUpPage
  {
    'w9rk4ehb': {
      'en': 'Создайте аккаунт',
      'ru': '',
    },
    'ijo1xg10': {
      'en': 'Email',
      'ru': '',
    },
    '3l0kpmhd': {
      'en': 'Введите пароль',
      'ru': '',
    },
    'w7i7e64i': {
      'en': 'Введите пароль',
      'ru': '',
    },
    'hp4cd48t': {
      'en': 'Создать аккаунт',
      'ru': '',
    },
    '11mxs9rw': {
      'en':
          'Нажимая кнопку Создать аккаунт, Вы соглашаетесь с Политикой конфиденциальности',
      'ru': '',
    },
    'lgxnxeua': {
      'en': 'Нажимая кнопку Создать аккаунт, Вы соглашаетесь с',
      'ru': '',
    },
    'eoqrrcll': {
      'en': 'Политикой конфиденциальности и',
      'ru': '',
    },
    '67fgmcmv': {
      'en': 'Пользовательским соглашением',
      'ru': '',
    },
    'g1rvyn1e': {
      'en': 'У Вас есть аккаунт? Войти',
      'ru': '',
    },
    'x1ol3f58': {
      'en': 'или',
      'ru': '',
    },
    '25g226f4': {
      'en': 'Home',
      'ru': '',
    },
  },
  // ContinueSignupPage
  {
    'v9hjwnvr': {
      'en': 'Завершение регистрации',
      'ru': '',
    },
    'gxy6zakw': {
      'en': 'Изменить фото',
      'ru': '',
    },
    'kunlbrxt': {
      'en': 'ФИО',
      'ru': '',
    },
    'z1sxs3e4': {
      'en': 'Индустрия',
      'ru': '',
    },
    'nsj054dk': {
      'en': 'Специальность',
      'ru': '',
    },
    'jbl6ygla': {
      'en': 'Номер телефона',
      'ru': '',
    },
    'to3cml9j': {
      'en': 'Страна',
      'ru': '',
    },
    'txo2f3r9': {
      'en': 'Мой город',
      'ru': '',
    },
    'jrh0s4gd': {
      'en': 'Продолжить',
      'ru': '',
    },
    'pca3hpze': {
      'en': 'Home',
      'ru': '',
    },
  },
  // ReportsPage
  {
    'yn6982zc': {
      'en': 'Выберите период',
      'ru': '',
    },
    'ij92v7js': {
      'en': 'Начало',
      'ru': '',
    },
    'pky042h0': {
      'en': 'Конец',
      'ru': '',
    },
    'yoorffuv': {
      'en': '[Some hint text...]',
      'ru': '',
    },
    'joei7gw3': {
      'en': 'Поиск',
      'ru': '',
    },
    'qvfyf8ve': {
      'en': 'Мои отчеты',
      'ru': '',
    },
    '86vrdppm': {
      'en': ' - ',
      'ru': '',
    },
    'h3cf4yqu': {
      'en': 'Отчеты',
      'ru': '',
    },
    '9bh1f4hy': {
      'en': 'Отчеты',
      'ru': '',
    },
  },
  // ProfileHomePage
  {
    'gdkvduyn': {
      'en': 'Главная страница',
      'ru': '',
    },
    '70fgqw00': {
      'en': 'Добро пожаловать,',
      'ru': '',
    },
    'v333pgi1': {
      'en': 'Посмотреть профиль',
      'ru': '',
    },
    'vt2osvnv': {
      'en': 'Мои инструменты',
      'ru': '',
    },
    'qc5ogjsq': {
      'en': 'Смотреть все',
      'ru': '',
    },
    'ew9kd6ks': {
      'en': 'Мои отчеты',
      'ru': '',
    },
    'bttsi936': {
      'en': 'Смотреть все',
      'ru': '',
    },
    '09ptez06': {
      'en': ' - ',
      'ru': '',
    },
    'yq1hunc3': {
      'en': 'Настройки',
      'ru': '',
    },
    'pbp6cp3m': {
      'en': 'Общие настройки',
      'ru': '',
    },
    'j9ocp4ko': {
      'en': 'Уведомления',
      'ru': '',
    },
    'dplkhctz': {
      'en': 'Политика конфиденциальности данных',
      'ru': '',
    },
    '8la6fgbu': {
      'en': 'О приложении',
      'ru': '',
    },
    'yiqlelxe': {
      'en': 'Отменить подписку',
      'ru': '',
    },
    'czqxe7r9': {
      'en': 'Текущая подписка',
      'ru': '',
    },
    '7lysnqce': {
      'en': 'Пробный доступ',
      'ru': '',
    },
    '62ocl5je': {
      'en': 'Бесплатно 30 дней',
      'ru': '',
    },
    '06vu7j7f': {
      'en': 'Отмена подписки',
      'ru': '',
    },
    'wwam51wy': {
      'en': 'Профиль',
      'ru': '',
    },
  },
  // MyToolsPage
  {
    'nyxk3fwe': {
      'en': 'Мои инструменты',
      'ru': '',
    },
    'b42ruyf9': {
      'en': 'Поиск',
      'ru': '',
    },
    'p6q8htvv': {
      'en': 'Button',
      'ru': '',
    },
    '1yq0zf1u': {
      'en': 'Инструменты',
      'ru': '',
    },
  },
  // AddNewToolPage
  {
    'a297mh43': {
      'en': 'Наименование инстумента',
      'ru': '',
    },
    'w8r186o0': {
      'en': 'Описание инструмента',
      'ru': '',
    },
    'zdsfqmfk': {
      'en': 'Введите описание инструмента',
      'ru': '',
    },
    '8f8f5g0d': {
      'en': 'Наименование магазина',
      'ru': '',
    },
    'uhz5nhgd': {
      'en': 'Дата покупки',
      'ru': '',
    },
    'eqenrtq8': {
      'en': 'Цена, тенге',
      'ru': '',
    },
    'krmln518': {
      'en': 'Опубликовать',
      'ru': '',
    },
    '48kml06p': {
      'en': 'Обязательное поле',
      'ru': '',
    },
    'l058y0bd': {
      'en': 'Please choose an option from the dropdown',
      'ru': '',
    },
    'ptcubvfr': {
      'en': 'Обязательное поле',
      'ru': '',
    },
    'h87kn7n3': {
      'en': 'Please choose an option from the dropdown',
      'ru': '',
    },
    'xa4b0iy9': {
      'en': 'Обязательное поле',
      'ru': '',
    },
    'cu3fyixq': {
      'en': 'Please choose an option from the dropdown',
      'ru': '',
    },
    'sxz3oy9z': {
      'en': 'Обязательное поле',
      'ru': '',
    },
    'vj91mmb3': {
      'en': 'Please choose an option from the dropdown',
      'ru': '',
    },
    'ms8sxg3a': {
      'en': 'Добавить инструмент',
      'ru': '',
    },
    'lflzzkqf': {
      'en': 'Home',
      'ru': '',
    },
  },
  // EditToolPage
  {
    'y492qare': {
      'en': 'Наименование инстумента',
      'ru': '',
    },
    '14swoqn7': {
      'en': 'Описание инструмента',
      'ru': '',
    },
    'k8h81yah': {
      'en': 'Введите описание инструмента',
      'ru': '',
    },
    '7wh60bvd': {
      'en': 'Наименование магазина',
      'ru': '',
    },
    'cnzgmy3x': {
      'en': 'Дата покупки',
      'ru': '',
    },
    'dttlvuad': {
      'en': 'Цена, тенге',
      'ru': '',
    },
    'x5yy8sw6': {
      'en': 'Выставить на продажу',
      'ru': '',
    },
    'l8f8x8w7': {
      'en': 'Снять с продаж',
      'ru': '',
    },
    'e2ytcx1x': {
      'en': 'Сохранить',
      'ru': '',
    },
    '173p52vv': {
      'en': 'Обязательное поле',
      'ru': '',
    },
    'sdrqo547': {
      'en': 'Please choose an option from the dropdown',
      'ru': '',
    },
    'a5b86i6k': {
      'en': 'Обязательное поле',
      'ru': '',
    },
    'ydhivi7g': {
      'en': 'Please choose an option from the dropdown',
      'ru': '',
    },
    'tsrtpde8': {
      'en': 'Обязательное поле',
      'ru': '',
    },
    'fwh87r2u': {
      'en': 'Please choose an option from the dropdown',
      'ru': '',
    },
    'q5rox2u0': {
      'en': 'Field is required',
      'ru': '',
    },
    'wb4ewnhi': {
      'en': 'Please choose an option from the dropdown',
      'ru': '',
    },
    'jhni1uyi': {
      'en': 'Редактировать',
      'ru': '',
    },
    'j872y4dj': {
      'en': 'Home',
      'ru': '',
    },
  },
  // ProfileEditPage
  {
    'inhapk1g': {
      'en': 'Мой профиль',
      'ru': '',
    },
    '1ce9is4x': {
      'en': 'Изменить фото',
      'ru': '',
    },
    'cpa95gkj': {
      'en': 'ФИО',
      'ru': '',
    },
    'a2tdey2u': {
      'en': 'Бахытжан Ибраев',
      'ru': '',
    },
    'l1edfrr6': {
      'en': 'Индустрия',
      'ru': '',
    },
    'hyww2uhq': {
      'en': 'Специальность',
      'ru': '',
    },
    'yqzhq23p': {
      'en': 'Номер телефона',
      'ru': '',
    },
    'g0qi81av': {
      'en': '+7 (700) 123-45-67',
      'ru': '',
    },
    'ws4fuk1c': {
      'en': 'Страна',
      'ru': '',
    },
    'buf9u7hz': {
      'en': '+7 (700) 123-45-67',
      'ru': '',
    },
    'fxdcfipt': {
      'en': 'Город',
      'ru': '',
    },
    'mry1u9ry': {
      'en': '+7 (700) 123-45-67',
      'ru': '',
    },
    '84z8oztq': {
      'en': 'Дата рождения',
      'ru': '',
    },
    'h8c7gbi6': {
      'en': 'Сохранить',
      'ru': '',
    },
    '5vjklq7w': {
      'en': 'Выйти',
      'ru': '',
    },
    'waxr8icr': {
      'en': 'Home',
      'ru': '',
    },
  },
  // Notes
  {
    'at3oyld2': {
      'en': 'Заметки',
      'ru': '',
    },
    'ztbj6y9n': {
      'en': 'Поиск',
      'ru': '',
    },
    'vevbov21': {
      'en': 'Заметки',
      'ru': '',
    },
  },
  // PointsPage
  {
    'azfb5xh7': {
      'en': 'Home',
      'ru': '',
    },
  },
  // AuthPage
  {
    'yo0i6sv5': {
      'en': 'Добро пожаловать',
      'ru': '',
    },
    '443v0iwp': {
      'en':
          'Orci, ante in platea lectus pulvinar. Cursus vestibulum nullam tincidunt diam. Aenean quis.',
      'ru': '',
    },
    'hihw4rv9': {
      'en': 'Я новый пользователь',
      'ru': '',
    },
    'e7c1i4oz': {
      'en': 'У меня есть аккаунт',
      'ru': '',
    },
    'gnfqxe4w': {
      'en': 'Home',
      'ru': '',
    },
  },
  // AllChats
  {
    'q3pbrm0z': {
      'en': 'Все сообщения',
      'ru': '',
    },
  },
  // createPointsPage
  {
    'yre4l98x': {
      'en': 'Создать заметку',
      'ru': '',
    },
    'r9rfk6rh': {
      'en': 'Название заметки',
      'ru': '',
    },
    'opxmprue': {
      'en': 'Начните писать',
      'ru': '',
    },
    'ua78911f': {
      'en': 'Начните писать',
      'ru': '',
    },
    'zsp9mljc': {
      'en': '+ Новый пункт',
      'ru': '',
    },
    'b56avqfi': {
      'en': 'Draw',
      'ru': '',
    },
    'i89uw3y1': {
      'en': 'Comment',
      'ru': '',
    },
    'w5yq23iy': {
      'en': 'Comment',
      'ru': '',
    },
    '0w2weuw5': {
      'en': 'Пожалуйста добавьте фото,\nНажмите на + внизу',
      'ru': '',
    },
    '0j7vnj1w': {
      'en': 'Обязательно к заполнению',
      'ru': '',
    },
    'pybajets': {
      'en': 'Please choose an option from the dropdown',
      'ru': '',
    },
    '1x0recpm': {
      'en': 'Field is required',
      'ru': '',
    },
    '5ccigfm2': {
      'en': 'Please choose an option from the dropdown',
      'ru': '',
    },
    '0242g456': {
      'en': 'Field is required',
      'ru': '',
    },
    'j2ihlvgm': {
      'en': 'Please choose an option from the dropdown',
      'ru': '',
    },
    '14iwtqrn': {
      'en': 'Home',
      'ru': '',
    },
  },
  // Marketplace
  {
    'q7tgaacn': {
      'en': 'Маркетплэйс',
      'ru': '',
    },
    '1swglqle': {
      'en': 'Поиск',
      'ru': '',
    },
    'sqgzos07': {
      'en': 'Маркетплейс',
      'ru': '',
    },
  },
  // EditPointsPage
  {
    'pzp0tso6': {
      'en': 'Edit note',
      'ru': '',
    },
    'mfo5wn1k': {
      'en': 'Note title',
      'ru': '',
    },
    'kxnp2owd': {
      'en': 'Note description',
      'ru': '',
    },
    'g5gsjxi3': {
      'en': 'Начните писать',
      'ru': '',
    },
    '3i3z7moh': {
      'en': '+ Новый пункт',
      'ru': '',
    },
    'poy7neyo': {
      'en': 'Обязательно к заполнению',
      'ru': '',
    },
    '9fszkl3b': {
      'en': 'Please choose an option from the dropdown',
      'ru': '',
    },
    '5mjp5q20': {
      'en': 'Field is required',
      'ru': '',
    },
    'gxr7xl8l': {
      'en': 'Please choose an option from the dropdown',
      'ru': '',
    },
    'o9try4cb': {
      'en': 'Field is required',
      'ru': '',
    },
    'ar4tglyy': {
      'en': 'Please choose an option from the dropdown',
      'ru': '',
    },
    '1gwsgofx': {
      'en': 'Home',
      'ru': '',
    },
  },
  // Paywall
  {
    'dmhg0icv': {
      'en': 'Выбери подписку',
      'ru': '',
    },
    'suu2w2v5': {
      'en':
          'Orci, ante in platea lectus pulvinar. Cursus vestibulum nullam tincidunt diam. Aenean quis.',
      'ru': '',
    },
    'xz05n7mn': {
      'en': 'Пробный доступ',
      'ru': '',
    },
    'xn5ioao0': {
      'en': 'Бесплатно 30 дней',
      'ru': '',
    },
    'jevs5u4d': {
      'en': 'Home',
      'ru': '',
    },
  },
  // PainterPage
  {
    'c69nsf5h': {
      'en': 'Изменено:10:15',
      'ru': '',
    },
    'ff1xnl18': {
      'en': 'Home',
      'ru': '',
    },
  },
  // ToolDetailPage
  {
    '6g79p2q3': {
      'en': 'Наименование инстумента',
      'ru': '',
    },
    '5czac6e7': {
      'en': 'Описание инструмента',
      'ru': '',
    },
    'o6t0s707': {
      'en': 'Введите описание инструмента',
      'ru': '',
    },
    'w9h2pmjn': {
      'en': 'Наименование магазина',
      'ru': '',
    },
    '3s8ldint': {
      'en': 'Добавить чек',
      'ru': '',
    },
    '8njgpx48': {
      'en': 'Дата покупки',
      'ru': '',
    },
    'keqb5fko': {
      'en': 'Цена, тенге',
      'ru': '',
    },
    '5q7sslpa': {
      'en': 'Продавца',
      'ru': '',
    },
    '4kajw6ay': {
      'en': 'Связаться',
      'ru': '',
    },
    'znm3rki1': {
      'en': 'Выставить на продажу',
      'ru': '',
    },
    'tzvubz9k': {
      'en': 'Снять с продаж',
      'ru': '',
    },
    'wsou3nl1': {
      'en': 'Home',
      'ru': '',
    },
  },
  // MyPurchases
  {
    'joc92vcd': {
      'en': 'My purchases',
      'ru': '',
    },
    'v99oajx4': {
      'en': 'Search',
      'ru': '',
    },
    '4fn6w8za': {
      'en': 'Purchase',
      'ru': '',
    },
  },
  // AddPurchase
  {
    '5x6ukx9l': {
      'en': 'Store name',
      'ru': '',
    },
    'nubmvaar': {
      'en': 'Store address',
      'ru': '',
    },
    'izd6oj4o': {
      'en': 'Purchase date',
      'ru': '',
    },
    'kio9qyq0': {
      'en': 'Price written on cheque',
      'ru': '',
    },
    't28zvv59': {
      'en': '9999',
      'ru': '',
    },
    '0n8zbuq2': {
      'en': 'Save',
      'ru': '',
    },
    '3v5bao4w': {
      'en': 'Обязательное поле',
      'ru': '',
    },
    '8vp38d66': {
      'en': 'Please choose an option from the dropdown',
      'ru': '',
    },
    'qq17il2u': {
      'en': 'Обязательное поле',
      'ru': '',
    },
    'ljbutugz': {
      'en': 'Please choose an option from the dropdown',
      'ru': '',
    },
    'sbg4m4as': {
      'en': 'Обязательное поле',
      'ru': '',
    },
    'x1x5nf03': {
      'en': 'Please choose an option from the dropdown',
      'ru': '',
    },
    'e0brlxj8': {
      'en': 'Обязательное поле',
      'ru': '',
    },
    '8o9tjpa5': {
      'en': 'Please choose an option from the dropdown',
      'ru': '',
    },
    'zcw5be7v': {
      'en': 'Add Purchase',
      'ru': '',
    },
    'ugh7wgjc': {
      'en': 'Home',
      'ru': '',
    },
  },
  // EditPurchase
  {
    'tgutrb0p': {
      'en': 'Store Name',
      'ru': '',
    },
    'c2lordig': {
      'en': 'Store Address',
      'ru': '',
    },
    'qfi0baeq': {
      'en': 'Purchase date',
      'ru': '',
    },
    'uwyckriu': {
      'en': 'Price written on cheque',
      'ru': '',
    },
    '3t3ptkt3': {
      'en': 'Save edit',
      'ru': '',
    },
    'su268l6g': {
      'en': 'Обязательное поле',
      'ru': '',
    },
    'pkgijaxj': {
      'en': 'Please choose an option from the dropdown',
      'ru': '',
    },
    'g2pukcfv': {
      'en': 'Обязательное поле',
      'ru': '',
    },
    '9oq8rm8y': {
      'en': 'Please choose an option from the dropdown',
      'ru': '',
    },
    'cpnjp74i': {
      'en': 'Обязательное поле',
      'ru': '',
    },
    'g3ui52ea': {
      'en': 'Please choose an option from the dropdown',
      'ru': '',
    },
    'iv2kwq9e': {
      'en': 'Field is required',
      'ru': '',
    },
    '6v3o898f': {
      'en': 'Please choose an option from the dropdown',
      'ru': '',
    },
    'ru8ggcqw': {
      'en': 'Edit',
      'ru': '',
    },
    'q57ohpgx': {
      'en': 'Home',
      'ru': '',
    },
  },
  // PurchaseDetail
  {
    's9wrgquw': {
      'en': 'Store Name',
      'ru': '',
    },
    '8yuto2kj': {
      'en': 'Store Address',
      'ru': '',
    },
    'hfpsnc5m': {
      'en': '(Tap photo to view)',
      'ru': '',
    },
    '6785yzx0': {
      'en': 'Purchase date',
      'ru': '',
    },
    '0igz02cb': {
      'en': 'Price written on cheque',
      'ru': '',
    },
    '2wkahpw9': {
      'en': 'Home',
      'ru': '',
    },
  },
  // About
  {
    'xax16wud': {
      'en':
          'We made it so you can take good care of your work tools, and in return they’ll take care of you.\nAlways have access to your digital tool box, on any device, in any place.\nSave, manage, track, keep receipts, and notes.\nAs you progress through your apprenticeship, out of pocket tool purchases add up.\nYou need to know what tools you own, how much was spent on them, and where they are, i.e work van, toolbox, shop floor, etc.\nYou want to keep more of your money and event get some back by claiming tool allowance tax deductions.\nIf you carry tool insurance, prove ownership by saving receipts digitally, no more paperwork.\nGet a mobile app that records your tools, storing the data securely on a cloud.\nYour toolbox is digitized, with complete purchase history and copies of receipts.\nSave reports to assist tax and insurance claims.\nCreate and keep notes related to your jobs and tools.\nAccess a tool marketplace shared by fellow tradespeople.\nOnTools uses:\nGoogle Cloud platform to provide security and scalability.\nProgressive web app format for flexibility and online performance on both Android and iOS devices.\nOCR technology for document scanning to avoid manual entry.',
      'ru': '',
    },
    'nyjkgyhc': {
      'en': 'О приложении',
      'ru': '',
    },
    '3q5idwsi': {
      'en': 'Home',
      'ru': '',
    },
  },
  // Report_del
  {
    'kv0eyeyl': {
      'en': 'Удалить отчет?',
      'ru': '',
    },
    'by72996b': {
      'en': 'Вы действительно хотите удалить:',
      'ru': '',
    },
    '82ho97ba': {
      'en': 'Отчет за 15.08.2022 - 16.08.2022',
      'ru': '',
    },
    'giftxoe8': {
      'en': 'Да удалить',
      'ru': '',
    },
    'd5149d2a': {
      'en': 'Отменить',
      'ru': '',
    },
  },
  // AddNoteElements
  {
    'j5x81b84': {
      'en': 'Сделать снимок',
      'ru': '',
    },
    'gnhcecgm': {
      'en': 'Выбрать изображение',
      'ru': '',
    },
    '0wcpxcqh': {
      'en': 'Преобразовать в список',
      'ru': '',
    },
    '8nxjr8ao': {
      'en': 'Обычный список',
      'ru': '',
    },
  },
  // AddNoteSettings
  {
    'kczowhhe': {
      'en': 'Создать копию',
      'ru': '',
    },
    'ytlyqod1': {
      'en': 'Поделиться',
      'ru': '',
    },
    'xyivg71l': {
      'en': 'Удалить',
      'ru': '',
    },
  },
  // Filter
  {
    'a8gtujkn': {
      'en': 'Фильтры',
      'ru': '',
    },
    'usq9wkey': {
      'en': 'Option 1',
      'ru': '',
    },
    'j76bwclh': {
      'en': 'Название инструмента',
      'ru': '',
    },
    'p8ax7tvh': {
      'en': 'Option 1',
      'ru': '',
    },
    'ut388fjt': {
      'en': 'Название магазина',
      'ru': '',
    },
    '7e6e4a7j': {
      'en': 'Есть',
      'ru': '',
    },
    '8mzey73b': {
      'en': 'Нет',
      'ru': '',
    },
    'j5nps9d4': {
      'en': 'Наличие чека',
      'ru': '',
    },
    '07sb0wk2': {
      'en': 'Применить',
      'ru': '',
    },
  },
  // Sort
  {
    '9rz39htq': {
      'en': 'Сортировка',
      'ru': '',
    },
    'njltgsz3': {
      'en': 'По дате',
      'ru': '',
    },
    'svqxqqzb': {
      'en': 'По новизне',
      'ru': '',
    },
    'k7jvndlt': {
      'en': 'По стоимости',
      'ru': '',
    },
    '20xen1yc': {
      'en': 'Применить',
      'ru': '',
    },
  },
  // Miscellaneous
  {
    '6gnnd6su': {
      'en': '',
      'ru': '',
    },
    'yswwsaz4': {
      'en': '',
      'ru': '',
    },
    'yxkqdsr1': {
      'en': '',
      'ru': '',
    },
    'uedvfx4m': {
      'en': '',
      'ru': '',
    },
    'eny5b3qf': {
      'en': '',
      'ru': '',
    },
    'xjua33jw': {
      'en': '',
      'ru': '',
    },
    '052qsw3z': {
      'en': '',
      'ru': '',
    },
    'x7f0bewt': {
      'en': '',
      'ru': '',
    },
    'heevl8ut': {
      'en': '',
      'ru': '',
    },
    'g9hgq7xy': {
      'en': '',
      'ru': '',
    },
    'qn0ix3en': {
      'en': '',
      'ru': '',
    },
    '3sqvd5oc': {
      'en': '',
      'ru': '',
    },
    'exfhwmmy': {
      'en': '',
      'ru': '',
    },
    '8gvpoka1': {
      'en': '',
      'ru': '',
    },
    '12g9ulyg': {
      'en': '',
      'ru': '',
    },
    '2pv0rqoc': {
      'en': '',
      'ru': '',
    },
    'ln5wctt7': {
      'en': '',
      'ru': '',
    },
    '8re09rv8': {
      'en': '',
      'ru': '',
    },
    'ug60cao1': {
      'en': '',
      'ru': '',
    },
    'dz3pp0z2': {
      'en': '',
      'ru': '',
    },
    'mxe343ft': {
      'en': '',
      'ru': '',
    },
    '7wlv24uo': {
      'en': '',
      'ru': '',
    },
    'tun9v2bl': {
      'en': '',
      'ru': '',
    },
  },
].reduce((a, b) => a..addAll(b));
