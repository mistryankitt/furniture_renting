// import 'package:intl/intl.dart';
//
// class TimeAgo {
//   static String timeAgoSinceDate(String dateString,
//       {bool numericDates = true}) {
//     DateTime notificationDate =
//         DateFormat("yyyy-MM-dd hh:mm:ss").parse(dateString, true);
//     // final d = DateTime.now();
//     Duration diff = notificationDate.difference(DateTime.now());
//
//     if (diff.inDays > 365) {
//       return "in ${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"}";
//     }
//     if (diff.inDays > 30) {
//       return "in ${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"}";
//     }
//     if (diff.inDays > 7) {
//       return "in ${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"}";
//     }
//     if (diff.inDays > 0) {
//       return "in ${diff.inDays} ${diff.inDays == 1 ? "day" : "days"}";
//     }
//     if (diff.inHours >= 1) {
//       return "in ${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"}";
//     }
//     if (diff.inMinutes > 0) {
//       return "in ${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"}";
//     }
//     if (diff.inSeconds >= 3) {
//       return "in ${diff.inSeconds} ${diff.inSeconds == 1 ? "second" : "seconds"}";
//     }
//     return "Today";
//   }
//
//   static String getTimeAgo(DateTime dateTime) {
//     final now = DateTime.now();
//     final difference = now.difference(dateTime);
//
//     if (difference.inDays >= 365) {
//       final years = (difference.inDays / 365).floor();
//       return '$years ${years == 1 ? 'year' : 'years'} ago';
//     } else if (difference.inDays >= 30) {
//       final months = (difference.inDays / 30).floor();
//       return '$months ${months == 1 ? 'month' : 'months'} ago';
//     } else if (difference.inDays >= 7) {
//       final weeks = (difference.inDays / 7).floor();
//       return '$weeks ${weeks == 1 ? 'week' : 'weeks'} ago';
//     } else if (difference.inDays >= 1) {
//       return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
//     } else if (difference.inHours >= 1) {
//       return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
//     } else if (difference.inMinutes >= 1) {
//       return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
//     } else {
//       return 'Today';
//     }
//   }
//
//   static String formatTime(DateTime dateTime) {
//     final now = DateTime.now();
//     final difference = now.difference(dateTime);
//     final isPast = now.isAfter(dateTime);
//     loggerPrint(print: "$difference");
//     loggerPrint(print: "$isPast");
//
//     if (difference.inDays >= 365) {
//       final years = (difference.inDays / 365).floor();
//       return '${isPast ? years : years + 1} year${years != 1 ? 's' : ''} ${isPast ? 'ago' : 'before'}';
//     } else if (difference.inDays >= 30) {
//       final months = (difference.inDays / 30).floor();
//       return '${isPast ? months : months + 1} month${months != 1 ? 's' : ''} ${isPast ? 'ago' : 'before'}';
//     } else if (difference.inDays >= 7) {
//       final weeks = (difference.inDays / 7).floor();
//       return '${isPast ? weeks : weeks + 1} week${weeks != 1 ? 's' : ''} ${isPast ? 'ago' : 'before'}';
//     } else if (difference.inDays >= 1) {
//       return '${difference.inDays} day${difference.inDays != 1 ? 's' : ''} ${isPast ? 'ago' : 'before'}';
//     } else if (difference.inHours >= 1) {
//       return 'Today';
//     } else {
//       return 'Just now';
//     }
//   }
// }
//
// // my_custom_messages.dart
// class MyCustomMessages implements LookupMessages {
//   // Override "en" locale messages with custom messages that are more precise and short
//   @override
//   String prefixAgo() => '';
//
//   @override
//   String prefixFromNow() => '';
//
//   @override
//   String suffixAgo() => '';
//
//   @override
//   String suffixFromNow() => '';
//
//   @override
//   String lessThanOneMinute(int seconds) => 'now';
//
//   @override
//   String aboutAMinute(int minutes) => '${minutes}m';
//
//   @override
//   String minutes(int minutes) => '${minutes}m';
//
//   @override
//   String aboutAnHour(int minutes) => '${minutes}m';
//
//   @override
//   String hours(int hours) => '${hours}h';
//
//   @override
//   String aDay(int hours) => '${hours}h';
//
//   @override
//   String days(int days) => '${days}d';
//
//   @override
//   String aboutAMonth(int days) => '${days}d';
//
//   @override
//   String months(int months) => '${months}mo';
//
//   @override
//   String aboutAYear(int year) => '${year}y';
//
//   @override
//   String years(int years) => '${years}y';
//
//   @override
//   String wordSeparator() => ' ';
// }
