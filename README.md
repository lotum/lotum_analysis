This package provides analysis options for Dart and Flutter which are used at
[Lotum][lotum_link]. For more information, see the [analysis
options][analysis_options_yaml].

## Usage

To use the analysis options, add `lotum_analysis` as a `dev_dependency` in your
`pubspec.yaml`:

```yaml
dev_dependencies:
  lotum_analysis:: ^1.0.0
```

Then, add an include in `analysis_options.yaml`:

```yaml
include: package:lotum_analysis/lotum_analysis.yaml
```

This will ensure you always use the latest version of the lints. If you wish to
restrict the lint version, specify a version of `analysis_options.yaml` instead:

```yaml
include: package:lotum_analysis/lotum_analysis:.1.0.0.yaml
```

[lotum_link]: https://www.lotum.de/
[analysis_options_yaml]: https://github.com/lotum/lotum_analysis/blob/main/lib
