import 'dart:async';

void  main() async {
  final controller = StreamController<int>.broadcast();
    
  final streamString = controller.stream.distinct()
  .where((event) => event != 1 )
  .asyncMap( _futureConvertIntegerInString);
    
   streamString.listen((event) { 
    print(event);
  });

  controller.sink.add(0);
  controller.sink.add(0);
  controller.sink.add(1);
  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
  controller.sink.add(4);
  controller.sink.add(4);
  controller.sink.add(5);
   

  await Future.delayed(const Duration(minutes: 30));
  controller.close();
}


 String _convertIntegerInString(int value){
   return  'convertido $value';
 }

Future<String> _futureConvertIntegerInString(int value) async {
  await Future.delayed(const Duration(seconds: 2));
  return "convertido $value";
}


