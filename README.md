# Millisecond

[![Linux Build][travis-image]][travis-url]
[![Pub version][pub-image]][pub-url]
[![Commitizen friendly][commitizen-image]][commitizen-url]

Library to easily convert various time formats to milliseconds and
milliseconds to human readable format.


## [Installing via Pub][pub-url]

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  millisecond: 0.1.0
```


--------------------------------------------------------------------------------

## Usage

```dart
import "package:millisecond/millisecond.dart" as ms;


// `String` to `int`
ms.parse("5h"); // => 18000000
ms.parse("20 sec"); // => 20000
ms.parse("1.5 hours"); // => 5400000
ms.parse("day"); // => null
ms.parse("2y"); // => 63115200000


// `num` to `String`
// Short format
ms.format(200); // 200ms
ms.format(1000); // 1s
ms.format(60 * 60 * 1000 * 6); // 6h

// Long format
ms.format(200, long: true); // 200 ms
ms.format(1000, long: true); // 1 second
ms.format(60 * 60 * 1000 * 6, long: true); // 6 hours


// `num` to `String`
// Short format
ms.format(60 * 60 * 1000 * 6); // => "6h"

// Long format
ms.format(1000, long: true); // => "1 second"
```


--------------------------------------------------------------------------------

## Test

```sh
pub run test
```


--------------------------------------------------------------------------------

## Contributing

1. Fork it (<https://github.com/SuperPaintman/ms.dart/fork>)
2. Create your feature branch (`git checkout -b feature/<feature_name>`)
3. Commit your changes (`git commit -am '<type>(<scope>): added some feature'`)
4. Push to the branch (`git push origin feature/<feature_name>`)
5. Create a new Pull Request


--------------------------------------------------------------------------------

## Contributors

- [SuperPaintman](https://github.com/SuperPaintman) SuperPaintman - creator, maintainer


--------------------------------------------------------------------------------

## API
[Docs][docs-url]


--------------------------------------------------------------------------------

## Changelog
[Changelog][changelog-url]


--------------------------------------------------------------------------------

## License

[MIT][license-url]


[license-url]: LICENSE
[changelog-url]: CHANGELOG.md
[docs-url]: https://superpaintman.github.io/ms.dart/
[travis-image]: https://img.shields.io/travis/SuperPaintman/ms.dart/master.svg?label=linux
[travis-url]: https://travis-ci.org/SuperPaintman/ms.dart
[pub-image]: https://img.shields.io/pub/v/millisecond.svg
[pub-url]: https://pub.dartlang.org/packages/millisecond
[commitizen-image]: https://img.shields.io/badge/commitizen-friendly-brightgreen.svg
[commitizen-url]: https://commitizen.github.io/cz-cli/
