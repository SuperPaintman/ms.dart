library millisecond;

/** Constants */
const _S = 1000;
const _M = _S * 60;
const _H = _M * 60;
const _D = _H * 24;
const _Y = _D * 365.25;
final _REGEXP_STR = new RegExp(
    r"^((?:\d+)?\.?\d+) *(milliseconds?|msecs?|ms|seconds?|secs?|s|minutes?|mins?|m|hours?|hrs?|h|days?|d|years?|yrs?|y)?$",
    caseSensitive: false);

/** Helpers */
String _plural(num ms, num n, String name) {
  if (ms < n * 1.5) {
    return "${(ms / n).floor()} ${name}";
  }

  return "${(ms / n).ceil()} ${name}s";
}

String _fmtShort(num ms) {
  if (ms >= _D) {
    return "${(ms / _D).round()}d";
  }

  if (ms >= _H) {
    return "${(ms / _H).round()}h";
  }

  if (ms >= _M) {
    return "${(ms / _M).round()}m";
  }

  if (ms >= _S) {
    return "${(ms / _S).round()}s";
  }

  return "${ms.floor()}ms";
}

String _fmtLong(num ms) {
  if (ms >= _D) {
    return _plural(ms, _D, "day");
  }

  if (ms >= _H) {
    return _plural(ms, _H, "hour");
  }

  if (ms >= _M) {
    return _plural(ms, _M, "minute");
  }

  if (ms >= _S) {
    return _plural(ms, _S, "second");
  }

  return "${ms.floor()} ms";
}

int _parse(String str) {
  final match = _REGEXP_STR.firstMatch(str);

  if (match == null) {
    return null;
  }

  final n = double.parse(match.group(1));
  final type = (match.group(2) ?? "ms").toLowerCase();

  switch (type) {
    case "years":
    case "year":
    case "yrs":
    case "yr":
    case "y":
      return (n * _Y).floor();
    case "days":
    case "day":
    case "d":
      return (n * _D).floor();
    case "hours":
    case "hour":
    case "hrs":
    case "hr":
    case "h":
      return (n * _H).floor();
    case "minutes":
    case "minute":
    case "mins":
    case "min":
    case "m":
      return (n * _M).floor();
    case "seconds":
    case "second":
    case "secs":
    case "sec":
    case "s":
      return (n * _S).floor();
    case "milliseconds":
    case "millisecond":
    case "msecs":
    case "msec":
    case "ms":
      return n.floor();
    default:
      return null;
  }
}

/// Parse the given [val].
///
///     import "package:ms/ms.dart" as ms;
///
///     ms.parse("5h"); // => 18000000
int parse(String val) => _parse(val);

/// Format the given [val].
///
/// Verbose formatting if [long] is `true`.
///
///     import "package:ms/ms.dart" as ms;
///
///     // Short format
///     ms.format(60 * 60 * 1000 * 6); // => "6h"
///
///     // Long format
///     ms.format(1000, long: true); // => "1 second"
String format(num val, {long = false}) => long ? _fmtLong(val) : _fmtShort(val);
