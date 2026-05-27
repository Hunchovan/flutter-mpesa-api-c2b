import 'package:flutter/material.dart';
import 'checkout_page.dart';
import 'settings_page.dart';

class ServiceItem {
  final String name;
  final String description;
  final double price;
  final IconData icon;

  ServiceItem({
    required this.name,
    required this.description,
    required this.price,
    required this.icon,
  });
}

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      ServiceItem(
        name: 'Pacote Internet',
        description: 'Plano 10GB',
        price: 100,
        icon: Icons.wifi,
      ),
      ServiceItem(
        name: 'Bilhete Evento',
        description: 'Entrada normal',
        price: 250,
        icon: Icons.event,
      ),
      ServiceItem(
        name: 'Assinatura App',
        description: 'Plano mensal',
        price: 50,
        icon: Icons.subscriptions,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Serviços'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: services.length,
              itemBuilder: (context, index) {
                final item = services[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ListTile(
                    leading: CircleAvatar(child: Icon(item.icon)),
                    title: Text(item.name),
                    subtitle: Text(item.description),
                    trailing: Text('${item.price.toStringAsFixed(0)} MZN'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CheckoutPage(service: item),
                        ),
                      );
                    },
                  ),
                );
              },
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
