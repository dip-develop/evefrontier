import 'package:evefrontier_api/evefrontier_api.dart';
import 'package:logging/logging.dart';

void main() {
  final api = EVEFrontierAPI(levelLog: Level.ALL);

  /*  api.getABISConfig().then((value) {
    print(value.toString());
  });
  api.getConfig().then((value) {
    print(value.toString());
  });
  api.getHealth().then((value) {
    print(value.toString());
  }); */

  /* api
      .verifyPod(PodEntity((p0) => p0
        ..entries = BuiltMap<String, PodValueEntity>.from({
          'additionalProp1': PodValueEntity((p1) => p1
            ..bigVal = 1
            ..boolVal = true
            ..bytesVal =
                BuiltList<int>.from(Uint8List.fromList([1, 2, 3])).toBuilder()
            ..stringVal = 'string'
            ..timeVal = DateTime.now().toIso8601String()
            ..valueType = PodValueTypeEnum.string)
        }).toBuilder()
        ..signature = 'string'
        ..signerPublicKey = 'string'))
      .then((value) {
    print(value.toString());
  }); */

  api.getKillMails().then((value) {
    print(value.toString());
  });
  api.getSmartAssemblies().then((value) {
    print(value.toString());
  });
  api.getSmartCharacters().then((value) {
    print(value.toString());
  });
  /*api.getSolarSystems().then((value) {
    print(value.length);
  });
  api.getTypes().then((value) {
    print(value.toString());
  }); */
}
