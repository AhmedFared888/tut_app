import 'package:tut_app/app/constants.dart';
import 'package:tut_app/app/extensions.dart';
import 'package:tut_app/data/response/responses.dart';
import 'package:tut_app/domain/models.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
        this?.id.orEmpty() ?? Constants.emptyString,
        this?.name.orEmpty() ?? Constants.emptyString,
        this?.numOfNotifications.orZero() ?? Constants.zero);
  }
}

extension ContactResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(
      this?.phone.orEmpty() ?? Constants.emptyString,
      this?.email.orEmpty() ?? Constants.emptyString,
      this?.link.orEmpty() ?? Constants.emptyString,
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
      this?.customer.toDomain(),
      this?.contacts?.toDomain(),
    );
  }
}
