class ApiUtilities {
  static const baseUrl = "https://chessmafia.com/php/M-0402/gift4all/api/";
  static const imageURL = "https://chessmafia.com/php/M-0402/gift4all/";

  //todo auth APIS URL
  static const String signInURL = "${baseUrl}login";
  static const String signUpURL = "${baseUrl}register";
  static const String forgotPasswordURL = "${baseUrl}forget-password";
  static const String forgetOtpVerifyURL = "${baseUrl}forgot-otp-verify";
  static const String signUpOtpVerifyURL = "${baseUrl}otp-verify";
  static const String resetPasswordURL = "${baseUrl}reset-password";
  static const String changePasswordURL = "${baseUrl}change-password";
  static const String logoutURL = "${baseUrl}logout";
  static const String deleteAccountURL = "${baseUrl}delete-account";

  //todo dashboard home screen APIS URL
  static const String getEventNamesListURL = "${baseUrl}get-eventname";
  static const String getReminderListURL = "${baseUrl}get-reminder";
  static const String createEventURL = "${baseUrl}add-event";
  static const String editEventURL = "${baseUrl}update-event";
  static const String getListEventURL = "${baseUrl}list-event";
  static const String socialAuthURL = "${baseUrl}social-login";
  static const String getEventDetailURL = "${baseUrl}get-event-deatils";
  static const String deleteEventURL = "${baseUrl}delete-event";

  //TODO my account screens APIS URL
  static const String getUserProfileURL = "${baseUrl}get-user-profile";
  static const String editProfileURL = "${baseUrl}update-profile";
  static const String notifySettingURL =
      "${baseUrl}account-notification-status";

  //TODO Gift Module screens APIS URL
  static const getRelationshipCategoryURL = "${baseUrl}get-category";
  static const getRelationshipPersonURL = "${baseUrl}get-person";
  static const addGiftReceiverURL = "${baseUrl}add-gift-receive";
  static const addGiftURL = "${baseUrl}add-gift";
  static const getGiftStatusURL = "${baseUrl}get-giftstatus";
  static const getGiftReceiverListURL =
      "${baseUrl}get-user-giftrecevier?event_id=";
  static const getGiftReceiverDetailsURL =
      "${baseUrl}get-gift-receive-deatils?id=";
  static const getGiftListURL = "${baseUrl}list-gift?gift_recevier_id=";
  static const deleteGiftReceiverURL = "${baseUrl}delete-gift-receive";
  static const deleteGiftURL = "${baseUrl}delete-gift";
  static const getGiftDetailsURL = "${baseUrl}get-gift-deatils?id=";
  static const updateGiftURL = "${baseUrl}update-gift";
  static const updateGiftReceiverURL = "${baseUrl}update-gift-receive";
  static const deleteGiftReceiptURL = "${baseUrl}delete-receipt";
  static const historyEventsURL = "${baseUrl}history-events";
  static const getDropdownFilterURL = "${baseUrl}get-user-filter-dropdown";
  static const getNotificationListAPI = "${baseUrl}user-notification";
  static const termsCondAPI = "${baseUrl}terms-privacy?id=1";
}
