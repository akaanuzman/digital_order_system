import '../../constants/_export_constants.dart';
import '../../theme/_export_theme.dart';
import '../../utils/ui_utils.dart';

abstract class BaseSingleton {
  AppColors get colors => AppColors.instance;
  AppTexts get texts => AppTexts.instance;
  AppTheme get theme => AppTheme.instance;
  UIUtils get uiUtils => UIUtils.instance;
  AppConstants get constants => AppConstants.instance;
}
