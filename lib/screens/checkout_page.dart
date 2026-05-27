import 'package:flutter/material.dart';
import 'package:teste01/screens/mpesa_service.dart';
import '../services/mpesa_service.dart';
import 'payment_success_page.dart';
import 'services_page.dart';

class CheckoutPage extends StatefulWidget {
  final ServiceItem service;

  const CheckoutPage({super.key, required this.service});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final phoneController = TextEditingController();
  bool isLoading = false;

  final mpesaService = MpesaService(backendUrl: 'http://youripaddress:3000');

  String formatPhone(String value) {
    String phone = value.replaceAll(RegExp(r'[^0-9]'), '');

    if (phone.startsWith('258')) return phone;
    if (phone.length == 9 && phone.startsWith('8')) return '258$phone';

    return phone;
  }

  Future<void> pagar() async {
    setState(() => isLoading = true);

    try {
      final formattedPhone = formatPhone(phoneController.text);

      final response = await mpesaService.pagarServico(
        phone: formattedPhone,
        amount: widget.service.price.toStringAsFixed(0),
        serviceName: widget.service.name,
      );

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => PaymentSuccessPage(
            serviceName: widget.service.name,
            amount: widget.service.price,
            response: response,
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Erro: $e')));
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.service.name,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(widget.service.description),
                  const SizedBox(height: 20),
                  Card(
                    child: ListTile(
                      title: const Text('Total a pagar'),
                      trailing: Text(
                        '${widget.service.price.toStringAsFixed(0)} MZN',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('Método de Pagamento'),
                  const SizedBox(height: 8),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Image.asset('assets/images/mpesa.png', width: 32),
                          const SizedBox(width: 12),
                          const Text('M-Pesa'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('Número M-Pesa'),
                  const SizedBox(height: 8),
                  TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixText: '+258 ',
                      hintText: '84 000 0000',
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : pagar,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE63946),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 8,
                        shadowColor: const Color(0xFFE63946).withOpacity(0.5),
                      ),
                      child: isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              'Pagar com M-Pesa',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Depois de clicar, confirme no telefone usando o PIN M-Pesa.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          // Rodapé com o autor
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey.shade300, width: 1),
              ),
            ),
            child: Center(
              child: Text(
                'Powered by Vlad Nguila',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
