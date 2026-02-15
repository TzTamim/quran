
import 'package:provider/provider.dart';

import '../features/onbording/provider/onbording_provider.dart';

var providers = [
  ChangeNotifierProvider(create: (_) => OnbordingProvider()),
];
