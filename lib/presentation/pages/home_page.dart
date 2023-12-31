import 'package:flutter/material.dart';
import 'package:testing_with_route_stubs_flutter/di/container.dart';
import 'package:testing_with_route_stubs_flutter/infrastructure/infra_dependencies.dart';

class HomePage extends StatefulWidget {
  final String textArgument;
  final HomeRemoteDataSource homeDataSource;

  const HomePage({
    Key? key,
    required this.textArgument,
    required this.homeDataSource,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? data;

  Future<void> _fetchData() async {
    setState(() => data = "Fetching...");

    try {
      String fetchedData = await widget.homeDataSource.getData();

      setState(() => data = fetchedData);
    } catch (e) {
      sl<ErrorReportingService>().reportError(e);

      setState(() => data = "Oops, something went wrong");
    }
  }

  @override
  void initState() {
    sl<AnalyticsService>().logEvent("home_page_entered");
    
    _fetchData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.textArgument, textAlign: TextAlign.center),
            const SizedBox(height: 48),
            Text(data ?? "No data fetched yet"),
          ],
        ),
      ),
    );
  }
}
