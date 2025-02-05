import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raccoon_counter/interface_SM/player_interface_cubit.dart';
import 'package:raccoon_counter/layouts/2P_A.dart';
import 'package:raccoon_counter/player_SM/player_cubit.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  WakelockPlus.enable();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
      MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => PlayerCubit()),
            BlocProvider(create: (context) => PlayerInterfaceCubit()),
          ],
          child: const MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(369, 780), // Your design draft size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Bebas'),
          home: Builder(
            builder: (context) {
              double screenWidth = MediaQuery.of(context).size.width;
              double screenHeight = MediaQuery.of(context).size.height;
              double aspectRatio = (screenWidth / 2) / (screenHeight / 2);
              return TWOPA(
                  aspectRatio: aspectRatio,
              );
            },
          ),
        );
      },
    );
  }
}