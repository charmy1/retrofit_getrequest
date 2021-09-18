import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingredients_list/application/ingredients_list/ingredients_bloc.dart';
import 'package:ingredients_list/domain/ingredients_list/ingredients_response_model.dart';
import 'package:injectable/injectable.dart';
import '';
import 'core/failures.dart';
import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  runApp(MyApp());
}

//https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<IngredientsBloc>(

        create: (context) => getIt<IngredientsBloc>()
          ..add(IngredientsEvent.readAllIngredients()),

        child: Scaffold(
          body: MyHomePageWidget(),
          appBar: AppBar(
            title: Text("Ingredients List"),
          ),
        ),
      ),
    );
  }
}

class MyHomePageWidget extends StatefulWidget {
  const MyHomePageWidget({Key? key}) : super(key: key);

  @override
  _MyHomePageWidgetState createState() => _MyHomePageWidgetState();
}

class _MyHomePageWidgetState extends State<MyHomePageWidget> {
  IngredientsResponseModel responseModel = IngredientsResponseModel(drinks: []);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<IngredientsBloc, IngredientsState>(
      listenWhen: (previous, current) =>
          previous.readFailureOrSuccessOption !=
          current.readFailureOrSuccessOption,
      listener: (context, state) {
        state.readFailureOrSuccessOption.fold(() => null, (a) {
          a.fold((l) {
            final snackBar = SnackBar(
                content: Text(FailureMessages().mapFailureToMessage(l)));
            Scaffold.of(context).showSnackBar(snackBar);
          }, (r) {
            responseModel = r;
          });
        });
      },
      builder: (context, state) {
        return (state.isSubmitting || state.readFailureOrSuccessOption.isNone())
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (responseModel.drinks.isNotEmpty)
                ? ListView.builder(
                    itemCount: responseModel.drinks.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(responseModel.drinks[index]?.strIngredient1??""),
                      );
                    },
                  )
                : Center(
                    child: Text("Something went wrong"),
                  );
      },
    );
  }
}
