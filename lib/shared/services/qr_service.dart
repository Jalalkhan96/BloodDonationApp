import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';

class QrService {
  String generateDonationQr({
    required String donationId,
    required String donorId,
    required String hospitalId,
  }) {
    return 'lifelink://donation?did=$donationId&uid=$donorId&hid=$hospitalId';
  }

  String generateCheckInQr({
    required String appointmentId,
    required String donorId,
  }) {
    return 'lifelink://checkin?aid=$appointmentId&uid=$donorId';
  }

  Widget generateQrWidget({
    required String data,
    double size = 200,
    Color? backgroundColor,
    Color? foregroundColor,
  }) {
    return QrImageView(
      data: data,
      version: QrVersions.auto,
      size: size,
      backgroundColor: backgroundColor ?? Colors.white,
      eyeStyle: const QrEyeStyle(
        eyeShape: QrEyeShape.square,
      ),
      dataModuleStyle: const QrDataModuleStyle(
        dataModuleShape: QrDataModuleShape.square,
      ),
    );
  }

  Map<String, String> parseQrData(String qrData) {
    final uri = Uri.dataFromString(qrData);
    final params = uri.queryParameters;
    return {
      'type': uri.pathSegments.isNotEmpty ? uri.pathSegments.first : '',
      ...params,
    };
  }

  bool isValidDonationQr(String qrData) {
    return qrData.startsWith('lifelink://donation');
  }

  bool isValidCheckInQr(String qrData) {
    return qrData.startsWith('lifelink://checkin');
  }
}
