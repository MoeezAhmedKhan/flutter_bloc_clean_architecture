
abstract class LoginEvent{}
class FormFieldChangedEvent extends LoginEvent {
  final String fieldName;
  final String value;

  FormFieldChangedEvent({required this.fieldName, required this.value});
}

class OnLoginEvent extends LoginEvent{}