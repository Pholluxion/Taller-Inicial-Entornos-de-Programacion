import 'package:args/args.dart';
import 'package:taller_inicial/mvc.dart';

/// use dart 3
/// dart run bin/main.dart --file <pathToCsvFile.csv>

void main(List<String> args) {
  var parser = ArgParser();
  parser.addOption('file', abbr: 'f');
  final path = parser.parse(args)['file'];

  final infoController = InfoController();
  final crudController = CrudController(filePath: path);
  crudController.read();

  final view = View(
    infoController: infoController,
    crudController: crudController,
  );

  view.init(path);
}
