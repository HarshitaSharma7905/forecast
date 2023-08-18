import 'package:flutter/material.dart';
import 'package:forecast/viewModel/ForecastViewModel.dart';
import 'package:provider/provider.dart';

class ForecastUI extends StatefulWidget {
  const ForecastUI({Key? key}) : super(key: key);

  @override
  State<ForecastUI> createState() => _ForecastUIState();
}

class _ForecastUIState extends State<ForecastUI> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: ((create)=>ForecastViewModel()),child: UI(),);
  }
}
class UI extends StatefulWidget {
  const UI({Key? key}) : super(key: key);

  @override
  State<UI> createState() => _UIState();
}

class _UIState extends State<UI> {
  @override
  Widget build(BuildContext context) {
    final viewModel=Provider.of<ForecastViewModel>(context);
    return Scaffold(
      body: Column(
        children: [
          Text('temperature'+viewModel.temperature),
          Text('windspeed'+viewModel.windspeed),
          Text('time'+viewModel.time),
          Text('windDirection'+viewModel.windDirection),

        ],
      ),
    );
  }
}
