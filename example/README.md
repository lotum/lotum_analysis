An example project that showcases how to enable the analysis options from
`package:lotum_analysis`, which contains analysis options used internally at
Lotum.

The `lotum_analysis` packages is listed as a `dev_dependency` in the
`pubspec.yaml` file.

The analysis options provided by the package are activated in the
`analysis_options.yaml` file. The analysis options enforced for this project can
be further customized in that file.

The Dart code in this project (e.g. lib/main.dart) is analyzed using the
configuration provided by `package:lotum_analysis`.

The issues identified by the analyzer are surfaced in IDEs with Dart support or
by invoking `flutter analyze` from the command line.
