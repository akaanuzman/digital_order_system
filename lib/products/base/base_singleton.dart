import '../constants/app_constants.dart';
import '../constants/image_constants.dart';

import '../constants/string_constants.dart';
import '../theme/app_theme.dart';
import '../theme/color/app_colors.dart';
import '../theme/text/app_texts.dart';
import '../../core/utils/app_validators.dart';
import '../utils/ui_utils.dart';

abstract class BaseSingleton {
  AppColors get colors => AppColors.instance;
  AppTexts get texts => AppTexts.instance;
  AppTheme get theme => AppTheme.instance;
  UIUtils get uIUtils => UIUtils.instance;
  AppValidators get validators => AppValidators.instance;
  AppConstants get constants => AppConstants.instance;
  ImageConstants get imageConstants => ImageConstants.instance;
  StringConstants get stringConstants => StringConstants.instance;
}
