import 'package:cbnits_graphql/configs/size_config.dart';
import 'package:cbnits_graphql/data/graphql_provider.dart';
import 'package:cbnits_graphql/routes.dart';
import 'package:cbnits_graphql/screens/main_page/bloc/data/countries_bloc.dart';
import 'package:cbnits_graphql/screens/main_page/bloc/search/search_bloc.dart';
import 'package:cbnits_graphql/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AppMain());
}

class AppMain extends StatelessWidget {
  AppMain({Key? key}) : super(key: key);

  // Initialize Bloc data providers
  final GraphQLProvider _countriesDataProvider = GraphQLProvider();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _blocProviders(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              return MaterialApp(
                builder: (context, widget) {
                  SizeConfig().init(constraints, orientation);
                  return widget!;
                },
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                initialRoute: '/',
                onGenerateRoute: AppRoutes.generateRoute,
              );
            }
          );
        },
      )
    );
  }

  // List of BlocProviders
  List<BlocProvider> _blocProviders() {
    return [
      BlocProvider<GetCountriesBloc>(  // Get Countries Data BlocProvider
          create: (context) =>
              GetCountriesBloc(dataProvider: _countriesDataProvider)),
      BlocProvider<SearchCountriesBloc>(  // Search Countries Data BlocProvider
          create: (context) =>
              SearchCountriesBloc()),
    ];
  }
}