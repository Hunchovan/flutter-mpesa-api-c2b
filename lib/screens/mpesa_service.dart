import 'dart:convert';
import 'package:http/http.dart' as http;

class MpesaService {
  final String backendUrl;

  MpesaService({required this.backendUrl});

  Future<Map<String, dynamic>> pagarServico({
    required String phone,
    required String amount,
    required String serviceName,
  }) async {
    final response = await http.post(
      Uri.parse('$backendUrl/api/mpesa/c2b'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'phone': phone,
        'amount': amount,
        'serviceName': serviceName,
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data;
    }

    throw Exception(data['message'] ?? 'Erro ao pagar com M-Pesa');
  }
}
