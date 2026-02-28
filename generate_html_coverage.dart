import 'dart:io';

void main() {
  final lcovFile = File('coverage/lcov.info');
  if (!lcovFile.existsSync()) {
    print('El archivo coverage/lcov.info no existe.');
    return;
  }

  final lines = lcovFile.readAsLinesSync();
  final Map<String, _FileData> filesData = {};
  _FileData? currentFile;

  for (final line in lines) {
    if (line.startsWith('SF:')) {
      final filename = line.substring(3);
      currentFile = _FileData(filename);
      filesData[filename] = currentFile;
    } else if (line.startsWith('DA:') && currentFile != null) {
      final parts = line.substring(3).split(',');
      if (parts.length >= 2) {
        final hit = int.tryParse(parts[1]) ?? 0;
        currentFile.totalLines++;
        if (hit > 0) currentFile.coveredLines++;
      }
    } else if (line == 'end_of_record') {
      currentFile = null;
    }
  }

  // Generate HTML
  final sb = StringBuffer();
  sb.writeln('<!DOCTYPE html>');
  sb.writeln('<html lang="es"><head><meta charset="UTF-8"><title>Reporte de Cobertura</title>');
  sb.writeln('<style>');
  sb.writeln(
    'body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif; background-color: #f4f4f4; padding: 20px; }',
  );
  sb.writeln('h1 { color: #333; }');
  sb.writeln('table { width: 100%; border-collapse: collapse; background: white; box-shadow: 0 1px 3px rgba(0,0,0,0.1); }');
  sb.writeln('th, td { text-align: left; padding: 12px; border-bottom: 1px solid #ddd; }');
  sb.writeln('th { background-color: #f8f9fa; font-weight: bold; }');
  sb.writeln('.high { color: #28a745; font-weight: bold; }');
  sb.writeln('.medium { color: #ffc107; font-weight: bold; }');
  sb.writeln('.low { color: #dc3545; font-weight: bold; }');
  sb.writeln(
    '.bar-container { width: 100px; background-color: #e9ecef; border-radius: 4px; overflow: hidden; height: 16px; display: inline-block; vertical-align: middle; margin-right: 10px; }',
  );
  sb.writeln('.bar { height: 100%; }');
  sb.writeln('</style></head><body>');

  sb.writeln('<h1>Reporte de Cobertura del Proyecto</h1>');
  sb.writeln('<table>');
  sb.writeln('<thead><tr><th>Archivo</th><th>Cobertura</th><th>Líneas (Hit/Total)</th></tr></thead>');
  sb.writeln('<tbody>');

  int globalTotal = 0;
  int globalHit = 0;

  for (final entry in filesData.entries) {
    final fd = entry.value;
    if (fd.totalLines == 0) continue;

    globalTotal += fd.totalLines;
    globalHit += fd.coveredLines;

    final perc = (fd.coveredLines / fd.totalLines) * 100;
    final colorClass = perc >= 80 ? 'high' : (perc >= 50 ? 'medium' : 'low');
    final barColor = perc >= 80 ? '#28a745' : (perc >= 50 ? '#ffc107' : '#dc3545');

    sb.writeln('<tr>');
    sb.writeln('<td>${fd.filename}</td>');
    sb.writeln(
      '<td><div class="bar-container"><div class="bar" style="width: ${perc}%; background-color: $barColor;"></div></div><span class="$colorClass">${perc.toStringAsFixed(1)}%</span></td>',
    );
    sb.writeln('<td>${fd.coveredLines} / ${fd.totalLines}</td>');
    sb.writeln('</tr>');
  }

  final globalPerc = globalTotal > 0 ? (globalHit / globalTotal) * 100 : 0;
  sb.writeln('</tbody>');
  sb.writeln('<tfoot><tr style="background-color: #f8f9fa; font-weight: bold;">');
  sb.writeln('<td>Total Project</td>');
  sb.writeln('<td>${globalPerc.toStringAsFixed(1)}%</td>');
  sb.writeln('<td>$globalHit / $globalTotal</td>');
  sb.writeln('</tr></tfoot>');
  sb.writeln('</table>');

  sb.writeln('</body></html>');

  final outputDir = Directory('coverage/html');
  if (!outputDir.existsSync()) {
    outputDir.createSync(recursive: true);
  }

  final htmlFile = File('coverage/html/index.html');
  htmlFile.writeAsStringSync(sb.toString());

  print('Generado exitosamente: ${htmlFile.absolute.path}');
}

class _FileData {
  final String filename;
  int totalLines = 0;
  int coveredLines = 0;

  _FileData(this.filename);
}
