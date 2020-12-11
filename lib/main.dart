import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:smarttextile/Chat/provider/document_upload_provider.dart';
import 'package:smarttextile/Chat/provider/image_upload_provider.dart';
import 'package:smarttextile/Chat/screens/chatscreens/chat_screen.dart';
import 'package:smarttextile/Chat/screens/search_screen.dart';
import 'package:smarttextile/login/models/user.dart';
import 'package:smarttextile/main_content/provider/circle_provider.dart';
import 'package:smarttextile/main_content/provider/provider_counter.dart';
import 'package:smarttextile/main_content/provider/provider_driver.dart';
import 'package:smarttextile/main_content/provider/provider_product_filter.dart';
import 'package:smarttextile/main_content/provider/set_screen.dart';
import 'package:provider/provider.dart';
import 'Business/Invoice/driver.dart';
import 'package:smarttextile/main_content/provider/provider_search.dart';
import 'package:smarttextile/main_content/provider/provider_supplier_filter_option.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:smarttextile/main_content/shared/size_config.dart';
import 'package:smarttextile/shared/check_user.dart';
import 'package:smarttextile/shared/provider_user.dart';

const String userBoxName = "User";
const String driverBox="Driver";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final document = await path.getApplicationDocumentsDirectory();
  Hive.init(document.path);
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(DriverAdapter());
  await Hive.openBox<User>(userBoxName);
  await Hive.openBox<User>(driverBox);
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => SetScreen(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => ProviderSupplierFilterOption(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderSearch(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderUser(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderDriver(),
        ),
        ChangeNotifierProvider(
          create: (context) => CircleProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderProductsFilter(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderCounter(),
        ),
        ChangeNotifierProvider(
          create: (_) => ImageUploadProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DocumentUploadProvider(),
        )
      ],
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: MaterialApp(
          routes: {
            '/search_screen': (context) => SearchScreen(),
            '/chat_screen': (context) => ChatScreen(),
          },
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              scaffoldBackgroundColor: Color(0xfffbfbfb),
              primaryColor: Color(0xff66CCCC)),
          home: CheckUser(), //LoginBody() //PHomePage(),
        ),
      ),
    );
  }
}
