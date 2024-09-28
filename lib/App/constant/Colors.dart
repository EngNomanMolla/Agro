
import 'dart:ui';
// import 'dart:ui';
//0xff16677B
//0xff38b579
// #=0*ff
const Color primaryColor = Color(0xff16677B);
const Color greyColor = Color(0xff38b579);
const Color softGreyColor = Color(0xff002159);
const Color blackColor = Color(0xFF000000);
abstract class AppColors {
  static const Color custom = Color(0xFF011f4b);
  static const Color primary = Color(0xFF0D6EFD);
  static const Color primaryLight = Color(0xFFC8E6CC);
  static const Color primaryDark = Color(0xFF387C40);
  static const Color navbar = Color(0xFFEDF7EF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color blackLight = Color(0xFF171717);
  static const Color search = Color(0xFF9B9B9B);
  static const Color greyLight = Color(0xFF818181);
  static const Color greyDark = Color(0xFF676269);
  static const Color redLight = Color(0xFFDD695E);
  static const Color onPrimary = Color(0xFFE9E9E9);
  static const Color text = Color(0xFF252525);
  static const Color dot = Color(0xFFD9D9D9);
  static const Color prefixIconColor = Color(0xFF99969B);
  static const Color textFieldIconColor = Color(0xff99969B);
  static const Color borderColor = Color(0xffD0D5DD);
  static const Color seaSalt = Color(0xffFAFAFA);
  static const Color ultraViolet = Color(0xff556080);
  static const Color dimGray = Color(0xff6D6D6D);
  static const Color greyLights = Color(0xffF6F6F6);
  static const Color davyGray = Color(0xff4A4A4A);
  static const Color celticBlue = Color(0xff326ED4);
  static const Color pistachio = Color(0xff89C990);
  static const Color pennBlue = Color(0xff0B1A54);
  static const Color persianBlue = Color(0xff193DC7);
  static const Color seaSait = Color(0xffF6F6F6);
  static const Color roseWood = Color(0xff62000d);
  static const Color bitterSweet = Color(0xffE47368);
  static const Color orangeWeb = Color(0xffFFAD01);
  static const Color silver = Color(0xffA6A6A6);
  static const Color magnolia = Color(0xffE5E5EF);
  static const Color chartText = Color(0xff615E83);
  static const Color coolGray = Color(0xff9291A5);
  static const Color spaceCadet = Color(0xff1E1B39);
  static const Color brunswickGreen = Color(0xff08443C);
  static const Color resultPageColor = Color(0xffEEF7EF);

  static const Color accent = Color(0xFF00B0FF);
  static const Color accentDark = Color(0xFF007BBB);
  static const Color accentLight = Color(0xFF62EFFF);
  static const Color background = Color(0xFFE3F2FD);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color error = Color(0xFFB00020);
  static const Color onSecondary = Color(0xFF000000);
  static const Color onBackground = Color(0xFF000000);
  static const Color onSurface = Color(0xFF000000);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF9E9E9E);
}









List<String> amount = ["20", "120", "70", "10"];

List<String> category = [
  "Pending Parcels",
  "Delivered Parcels",
  "Partial Delivered Parcels",
  "Return Parcels",
];

List<Color> categoryCardColor = [
  Color(0xFFACDDDE).withOpacity(0.3),
  Color(0xFFD791EF).withOpacity(0.2),
  Color(0xFFFDA9D8).withOpacity(0.25),
  Color(0xFFFAF6C7).withOpacity(0.3),
];

List<Color> categoryCardTextColor = [
  Color(0xFF014D57),
  Color(0xFF7C00A8),
  Color(0xFF8F0152),
  Color(0xFF9D5502),
];

List<Color> categoryImageColor = [
  Color(0xFF01888A),
  Color(0xFFAA64CC),
  Color(0xFFF084C1),
  Color(0xFFF89D02),
];






  int hexColor(String color){
// adding prefix
  String newColor='0*ff' + color;
// removing # sign
  newColor= newColor.replaceAll('#', ' ');
  // converting it to the integer
  int finalColor=int.parse(newColor);
  return finalColor;
}
