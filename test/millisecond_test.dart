import "package:test/test.dart";
import "package:millisecond/millisecond.dart" as ms;

void main() {
  // `String` -> `int`
  group("parse(val)", () {
    group("short", () {
      test("not throw an error", () {
        ms.parse("1m");
      });

      test("preserve ms", () {
        expect(ms.parse("100"), equals(100));
      });

      test("convert from m to ms", () {
        expect(ms.parse("1m"), equals(60000));
      });

      test("convert from m to ms", () {
        expect(ms.parse("1m"), equals(60000));
      });

      test("convert from h to ms", () {
        expect(ms.parse("1h"), equals(3600000));
      });

      test("convert d to ms", () {
        expect(ms.parse("2d"), equals(172800000));
      });

      test("convert s to ms", () {
        expect(ms.parse("1s"), equals(1000));
      });

      test("convert ms to ms", () {
        expect(ms.parse("100ms"), equals(100));
      });

      test("work with decimals", () {
        expect(ms.parse("1.5h"), equals(5400000));
      });

      test("work with multiple spaces", () {
        expect(ms.parse("1   s"), equals(1000));
      });

      test("return `null` if invalid", () {
        expect(ms.parse("@"), equals(null));
      });

      test("case-insensitive", () {
        expect(ms.parse("1.5H"), equals(5400000));
      });

      test("work with numbers starting with .", () {
        expect(ms.parse(".5s"), equals(500));
      });

      test("floor", () {
        expect(ms.parse("20.5ms"), equals(20));
      });
    });

    group("long", () {
      test("not throw an error", () {
        ms.parse("53 milliseconds");
      });

      test("convert milliseconds to ms", () {
        expect(ms.parse("53 milliseconds"), equals(53));
      });

      test("convert msecs to ms", () {
        expect(ms.parse("17 msecs"), equals(17));
      });

      test("convert sec to ms", () {
        expect(ms.parse("1 sec"), equals(1000));
      });

      test("convert from min to ms", () {
        expect(ms.parse("1 min"), equals(60000));
      });

      test("convert from hr to ms", () {
        expect(ms.parse("1 hr"), equals(3600000));
      });

      test("convert days to ms", () {
        expect(ms.parse("2 days"), equals(172800000));
      });

      test("work with decimals", () {
        expect(ms.parse("1.5 hours"), equals(5400000));
      });

      test("floor", () {
        expect(ms.parse("20.5 milliseconds"), equals(20));
      });
    });
  });

  // `num` -> `String`
  group("format(number, long: true)", () {
    test("not throw an error", () {
      ms.format(500, long: true);
    });

    test("support milliseconds", () {
      expect(ms.format(500, long: true), equals("500 ms"));
    });

    test("support seconds", () {
      expect(ms.format(1000, long: true), equals("1 second"));
      expect(ms.format(1200, long: true), equals("1 second"));
      expect(ms.format(10000, long: true), equals("10 seconds"));
    });

    test("support minutes", () {
      expect(ms.format(60 * 1000, long: true), equals("1 minute"));
      expect(ms.format(60 * 1200, long: true), equals("1 minute"));
      expect(ms.format(60 * 10000, long: true), equals("10 minutes"));
    });

    test("support hours", () {
      expect(ms.format(60 * 60 * 1000, long: true), equals("1 hour"));
      expect(ms.format(60 * 60 * 1200, long: true), equals("1 hour"));
      expect(ms.format(60 * 60 * 10000, long: true), equals("10 hours"));
    });

    test("support days", () {
      expect(ms.format(24 * 60 * 60 * 1000, long: true), equals("1 day"));
      expect(ms.format(24 * 60 * 60 * 1200, long: true), equals("1 day"));
      expect(ms.format(24 * 60 * 60 * 10000, long: true), equals("10 days"));
    });

    test("round", () {
      expect(ms.format(234234234, long: true), equals("3 days"));
    });
  });

  group("format(number)", () {
    test("not throw an error", () {
      ms.format(500);
    });

    test("support milliseconds", () {
      expect(ms.format(500), equals("500ms"));
    });

    test("support seconds", () {
      expect(ms.format(1000), equals("1s"));
      expect(ms.format(10000), equals("10s"));
    });

    test("support minutes", () {
      expect(ms.format(60 * 1000), equals("1m"));
      expect(ms.format(60 * 10000), equals("10m"));
    });

    test("support hours", () {
      expect(ms.format(60 * 60 * 1000), equals("1h"));
      expect(ms.format(60 * 60 * 10000), equals("10h"));
    });

    test("support days", () {
      expect(ms.format(24 * 60 * 60 * 1000), equals("1d"));
      expect(ms.format(24 * 60 * 60 * 10000), equals("10d"));
    });

    test("round", () {
      expect(ms.format(234234234), equals("3d"));
    });
  });
}
