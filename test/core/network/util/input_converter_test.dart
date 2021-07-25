import 'package:clean_architecture_tdd/core/util/input_converter.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  InputConverter inputConverter;

  setUp(() {
    inputConverter = InputConverter();
  });

  group('stringToUnsignedInt', () {
    test(
        'should return an Integer when the String represents an unsigned integer',
        () async {
      // arrange
      final str = '234';

      // act
      final result = inputConverter.stringToUnsignedInteger(str);

      // assert
      expect(result, Right(234));
    });

     test(
        'should return a Failure when the string is not an integer',
        () async {
      // arrange
      final str = 'abc';

      // act
      final result = inputConverter.stringToUnsignedInteger(str);

      // assert
      expect(result, Left(InvalidInputFailure()));
    });

    test(
        'should return a Failure when the string is a negative integer',
        () async {
      // arrange
      final str = '-123';

      // act
      final result = inputConverter.stringToUnsignedInteger(str);

      // assert
      expect(result, Left(InvalidInputFailure()));
    });
  });
}
