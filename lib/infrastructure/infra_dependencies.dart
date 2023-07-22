class HomeRemoteDataSource {
  Future<String> getData() async {
    await Future.delayed(const Duration(seconds: 2));
    return "Home data from the HomeDataSource!";
  }
}

class ErrorReportingService {
  Future<void> reportError(dynamic e) async {
    // reports error
  }
}

class AnalyticsService {
  Future<void> logEvent(String name) async {
    // logs event
  }
}