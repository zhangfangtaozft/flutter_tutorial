import 'dart:async';

class Cake {

}

class Order {
  String type;
  Order(this.type);
}

void main() {
  final controller = StreamController();
  final order = Order('chaocolate');
  final baker = StreamTransformer.fromHandlers(
    handleData: (cakeType, sink) {
      if (cakeType == 'chaocolate') {
        sink.add(Cake());
      } else {
        sink.addError('I can\'t bake that type!!!');
      }
    }
  );
  controller.sink.add(order);
  controller.stream
  .map((order) => order.type)
  .transform(baker)
  .listen((cake) => print('Here \'s your cake $cake'),
  onError: (err) => print(err)
  );
}

