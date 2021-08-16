import 'package:zxing_lib/aztec.dart';
import 'package:zxing_lib/datamatrix.dart';
import 'package:zxing_lib/maxicode.dart';
import 'package:zxing_lib/oned.dart';
import 'package:zxing_lib/pdf417.dart';
import 'package:zxing_lib/qrcode.dart';
import 'package:zxing_lib/zxing.dart';

///
/// Created by
///
/// ─▄▀─▄▀
/// ──▀──▀
/// █▀▀▀▀▀█▄
/// █░░░░░█─█
/// ▀▄▄▄▄▄▀▀
///
/// Rafaelbarbosatec
/// on 16/08/21
class QRCodeDartScanMultiReader {
  final List<BarcodeFormat> formats;

  List<Reader> _readers = [];

  QRCodeDartScanMultiReader(this.formats) {
    formats.forEach((format) {
      switch (format) {
        case BarcodeFormat.AZTEC:
          _readers.add(AztecReader());
          break;
        case BarcodeFormat.CODABAR:
          _readers.add(CodaBarReader());
          break;
        case BarcodeFormat.CODE_39:
          _readers.add(Code39Reader());
          break;
        case BarcodeFormat.CODE_93:
          _readers.add(Code93Reader());
          break;
        case BarcodeFormat.CODE_128:
          _readers.add(Code128Reader());
          break;
        case BarcodeFormat.DATA_MATRIX:
          _readers.add(DataMatrixReader());
          break;
        case BarcodeFormat.EAN_8:
          _readers.add(EAN8Reader());
          break;
        case BarcodeFormat.EAN_13:
          _readers.add(EAN13Reader());
          break;
        case BarcodeFormat.ITF:
          _readers.add(ITFReader());
          break;
        case BarcodeFormat.MAXICODE:
          _readers.add(MaxiCodeReader());
          break;
        case BarcodeFormat.PDF_417:
          _readers.add(PDF417Reader());
          break;
        case BarcodeFormat.QR_CODE:
          _readers.add(QRCodeReader());
          break;
        case BarcodeFormat.RSS_14:
          _readers.add(RSS14Reader());
          break;
        case BarcodeFormat.RSS_EXPANDED:
          _readers.add(RSSExpandedReader());
          break;
        case BarcodeFormat.UPC_A:
          // TODO: Handle this case.
          break;
        case BarcodeFormat.UPC_E:
          // TODO: Handle this case.
          break;
        case BarcodeFormat.UPC_EAN_EXTENSION:
          // TODO: Handle this case.
          break;
      }
    });
  }

  Result? decode(BinaryBitmap image) {
    for (final reader in _readers) {
      Result? result;
      try {
        result = reader.decode(image);
      } catch (e) {}
      if (result != null) {
        return result;
      }
    }
  }
}
