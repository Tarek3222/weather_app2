import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/core/constants/app_routes.dart';
import 'package:weather_app/core/utils/services_locator.dart';
import 'package:weather_app/features/home/data/repos/my_repo.dart';
import 'package:weather_app/features/home/presentation/view_model/get_current_weather_cubit/get_current_weather_cubit.dart';
import 'package:weather_app/features/notifications/data/services/firebase_api.dart';
import 'package:weather_app/firebase_options.dart';

void main() async {
  // await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotifications();
  setup();
  runApp(
    DevicePreview(
      builder: (context) {
        return const WeatherApp();
      },
      enabled: true,
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocProvider(
          create: (context) => GetCurrentWeatherCubit(
            getIt.get<MyRepo>(),
          ),
          child: MaterialApp.router(
            routerConfig: AppRoutes.routers,
            debugShowCheckedModeBanner: false,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            theme: ThemeData(
              fontFamily: GoogleFonts.poppins().fontFamily,
              useMaterial3: true,
            ),
          ),
        );
      },
    );
  }
}
