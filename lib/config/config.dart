class Api {
  static const _base = "http://9coinapi.ap-southeast-1.elasticbeanstalk.com";
  static const _api = "/api";
  static const _register = "/register";
  static const _login = "/login";
  static const _forgetPassword = "/forget_password";
  static const _changePassword = "/change_password";
  static const _getPdf = "/get_pdf";
  static const _luckyDraw = "/lucky_draw";
  static const _luckyDrawn = "/check_participants?participant_id";
  static const _news = "/news";
  static const _partcipants = "/add_participants";
  static const _notification = "/notifications";

  static String baseUrl = "$_base$_api";
  static String login = "$_base$_api$_login";
  static String register = "$_base$_api$_register";
  static String getPdf = "$_base$_api$_getPdf";
  static String getLuckyDraw = "$_base$_api$_luckyDraw";
  static String getLuckyDrawn = "$_base$_api$_luckyDrawn";
  static String getNews = "$_base$_api$_news";
  static String updatePartcipants = "$_base$_api$_partcipants";
  static String forgetPassword = "$_base$_api$_forgetPassword";
  static String changePassword = "$_base$_api$_changePassword";
  static String notification = "$_base$_api$_notification";
}
