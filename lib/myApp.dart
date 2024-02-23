import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fultter_assigment_bank_mas/screens/landing_page/bloc/landing_page_bloc.dart';

import 'common/app_theme.dart';
import 'core/router/app_router.dart';
import 'core/router/routes.dart';
import 'di.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<LandingPageBloc>(
                  create: (context) => getIt<LandingPageBloc>()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightAppTheme,
              navigatorKey: AppRouter.navigatorKey,
              onGenerateRoute: AppRouter.generateRoute,
              initialRoute: Routes.landingPage,
            ),
          );
        });
  }
}
