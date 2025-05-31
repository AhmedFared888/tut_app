// Creating Extensions Functions

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return '';
    } else {
      return this!;
    }
  }
}

extension NonNullInt on int? {
  int orZero() {
    if (this == null) {
      return 0;
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