import 'package:servu_api/src/data/errors/serv_error.dart';

/// Indicates that was a issue that preventing a operation to complete
/// due to invalid arguments.
class ServValidationError extends ServError {
  final String field;
  final String issue;
  ServValidationError(this.field, this.issue) : super('$field: $issue');
}
