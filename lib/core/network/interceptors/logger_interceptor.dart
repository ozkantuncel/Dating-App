
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

class LoggerInterceptor extends TalkerDioLogger{
  LoggerInterceptor()
  : super (
    settings: const TalkerDioLoggerSettings(
      printRequestData: true,
      printRequestHeaders: true,

      printResponseData: true,
      printResponseHeaders: true,

      printErrorData: true,
    )
  );
}