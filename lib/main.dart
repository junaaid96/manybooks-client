import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:manybooks_v2/screens/account_screen.dart';
import 'package:manybooks_v2/screens/book_details_screen.dart';
import 'package:manybooks_v2/screens/chapter_screen.dart';
import 'package:manybooks_v2/screens/dashboard_screen.dart';
import 'package:manybooks_v2/screens/highlighting_screen.dart';
import 'package:manybooks_v2/screens/home_screen.dart';
import 'package:manybooks_v2/screens/library_screen.dart';
import 'package:manybooks_v2/screens/login_screen.dart';
import 'package:manybooks_v2/screens/notes_screen.dart';
import 'package:manybooks_v2/screens/read_book_screen.dart';
import 'package:manybooks_v2/screens/splash_screen.dart';
import 'package:manybooks_v2/screens/story_screen.dart';
import 'package:manybooks_v2/screens/upload_screen.dart';
import 'package:manybooks_v2/utils/api_callings.dart';
import 'package:manybooks_v2/widgets/last_read_book.dart';
import 'package:one_context/one_context.dart';
import 'package:prefs/prefs.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/reading_book_screen.dart';
import 'screens/search_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  // check if is running on Web
  if (kIsWeb) {
    // initialiaze the facebook javascript SDK
    await FacebookAuth.i.webInitialize(
      appId: "${dotenv.env['FACEBOOK_APP_ID']}",
      cookie: true,
      xfbml: true,
      version: "v13.0",
    );
  }
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return StateBuilder(
    //   observe: () => stbs,
    //   builder: (context, _) => ,
    // );
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "OpenSans", scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/homescreen': (context) => HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/bookDetails': (context) => BookDetails(),
        '/lastReadBook': (context) => LastReadBook(),
        '/readingBookPage': (context) => ReadingBookScreen(),
        '/upload': (context) => const UploadScreen(),
        '/search': (context) => SearchScreen(),
        '/story': (context) => const StoryScreen(),
        '/library': (context) => LibraryScreen(),
        '/account': (context) => AccountScreen(),
        '/chapter': (context) => ChapterScreen(),
        '/highlight': (context) => HighlightScreen(),
        // '/note': (context) => NoteScreen(),
        // '/booklist': (context) => BookList(),
      },
      builder: OneContext().builder,
      navigatorKey: OneContext().key,
    );
  }
}
