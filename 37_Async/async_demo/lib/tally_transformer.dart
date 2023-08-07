import 'dart:async';

class TallyTransformer implements StreamTransformer<int, dynamic> {
  late num sum = 0;
  final StreamController _controller = StreamController();
  @override
  Stream bind(Stream stream) {
    stream.listen((event) {
      sum += event;
      _controller.add(sum);
    });
    return _controller.stream;
  }

  @override
  StreamTransformer<RS, RT> cast<RS, RT>() => StreamTransformer.castFrom(this);
  
}