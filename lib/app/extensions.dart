// Creating Extensions Functions

import 'package:tut_app/app/constants.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return Constants.emptyString;
    } else {
      return this!;
    }
  }
}

extension NonNullInt on int? {
  int orZero() {
    if (this == null) {
      return Constants.zero;
    } else {
      return this!;
    }
  }
}
  /// void test(){
  /// 
  /// String? data = 'test';
  /// int? count = null;
  /// 
  /// print(data.orEmpty());   output => "test"   becouse there is a data
  /// print(count.orZero());   output =>   0      becouse there is no data
  /// }