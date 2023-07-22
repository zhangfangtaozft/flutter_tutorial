import 'dart:html';

void main() {
  var button = ButtonElement();
  button.onClick
  .timeout(
    Duration(seconds: 1),
    onTimeout: (sink) => sink.addError('You lost!!!')
  )
  .listen(
    (event) {},
    onError: (err) => print(err)
  );
}