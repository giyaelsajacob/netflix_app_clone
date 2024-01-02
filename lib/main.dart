import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/downloads/downloads_bloc.dart';
import 'package:netflix_app/application/fastlaugh/fastlaugh_bloc.dart';
import 'package:netflix_app/application/home/home_bloc.dart';
import 'package:netflix_app/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/di/injectable.dart';
import 'package:netflix_app/presentataion/main_page/widgets/screen_main_page.dart';

import 'application/search/search_bloc.dart';

Future<void> main() async{
    //app start akumnbo injection nadakan vendi
  //to solve issues
  WidgetsFlutterBinding.ensureInitialized();
await configureInjection();//ith future function ayond void main future aaki set akum
    runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    //nammlde bloc kond varan vendi widget vech wrap cheyum
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx)=>getIt<DownloadsBloc>()),
        BlocProvider(create: (ctx)=>getIt<SearchBloc>()),
        BlocProvider(create: (ctx)=>getIt<FastlaughBloc>()),
        BlocProvider(create: (ctx)=>getIt<HotAndNewBloc>()),
        BlocProvider(create: (ctx)=>getIt<HomeBloc>()),
      ],
      child: MaterialApp(
        title: 'NetFlix App',
        theme: ThemeData(
          appBarTheme:AppBarTheme(backgroundColor: Colors.transparent) ,
         primarySwatch: Colors.blue,
          backgroundColor: Colors.black,
            scaffoldBackgroundColor:backgroundColor,
            textTheme:TextTheme(
              bodyText1:TextStyle(color: Colors.white),
              bodyText2: TextStyle(color: Colors.white)
            )
        ),
        home:ScreenMainPage(releasedPastYear: [], top10TvShow: []),
      ),
    );
  }
}

