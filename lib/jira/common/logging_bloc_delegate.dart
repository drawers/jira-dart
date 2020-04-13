import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class LoggingBlocDelegate extends BlocDelegate {

  final Logger logger;

  LoggingBlocDelegate(this.logger);

  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    logger.d(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    logger.d(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    logger.d(error);
  }
}
