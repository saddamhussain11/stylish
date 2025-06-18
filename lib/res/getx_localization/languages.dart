import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'email_hint': 'Please Enter Your Email',
          'internet_excaption':
              'We Are unable To Show Your Result\nCheck Your data\nconection.',
          'genrel_excaption': 'We Are unable To proces\n Please Try Again.'
        },
        'ur_PK': {'email_hint': 'براہ کرم اپنا ای میل درج کریں'}
      };
}
