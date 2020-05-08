import 'package:build/build.dart';

class CopyBuilder implements Builder {
  @override
  Map<String, List<String>> get buildExtensions => {
        '.txt': ['.copy.txt'],
      };

  @override
  Future<void> build(BuildStep buildStep) async {
    // Retrieve the currentry matched asset
    var inputId = buildStep.inputId;

    // Create a new targe `AssetId` based on the current one
    var copyAssetId = inputId.changeExtension('.copy.txt');
    var contents = await buildStep.readAsString(inputId);

    // Write out the new asset
    await buildStep.writeAsString(copyAssetId, contents);
  }
}
