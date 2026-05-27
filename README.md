# Flutter M-Pesa Integration - Implementation Example

> A clear and well-documented implementation of M-Pesa payment API integration for Flutter developers.

## 📋 Overview

This project was created to facilitate M-Pesa payment API integration in Flutter applications. Official documentation was difficult to find and disorganized, so this complete solution was developed to help other developers.

## 📚 Official Documentation

- [M-Pesa Developer Documentation](https://developer.mpesa.vm.co.mz/documentation/)

## 🎯 Features

-  Complete M-Pesa API Integration
-  Clean and intuitive interface
-  Phone number validation
-  Payment confirmation
-  Success page with transaction details
-  Included Node.js backend

## 📱 Application Screens

### 1. Services Screen
Initial screen showing available services for payment.

![Services Screen](./assets/images/screenshots/1.png)

### 2. Payment Screen
Form to enter the M-Pesa number and confirm payment.

![Payment Screen](./assets/images/screenshots/2.png)

### 3. M-Pesa Notification
Payment confirmation received on the device.

![M-Pesa Notification](./assets/images/screenshots/4.jpeg)

### 4. Success Screen
Transaction completion confirmation with details.

![Success Screen](./assets/images/screenshots/3.png)

## 🚀 Installation

### Prerequisites
- Flutter SDK (3.11.5 or later)
- Node.js (for backend)
- Valid M-Pesa credentials

### Installation Steps

1. **Clone the repository**
```bash
git clone https://github.com/Hunchovan/flutter-mpesa-api-c2b.git
cd teste01
```

2. **Set up environment variables**

Create a `.env` file in the `backend_pay/` folder:

```env
MPESA_API_KEY=your_api_key_here
MPESA_PUBLIC_KEY=your_public_key_here
MPESA_SERVICE_PROVIDER_CODE=your_code_here
MPESA_BASE_URL=https://api.sandbox.vm.co.mz:18352
```

Use `.env.example` as a reference.

3. **Install Flutter dependencies**
```bash
flutter pub get
```

4. **Install backend dependencies**
```bash
cd backend_pay
npm install
```

5. **Configure server address**

In the file `lib/screens/checkout_page.dart`, replace `youripaddress` with your server IP:

```dart
final mpesaService = MpesaService(backendUrl: 'http://your_ip:3000');
```

## 🛠️ How to Use

### Starting the Backend

```bash
cd backend_pay
node server.js
```

The server will run on port 3000.

### Running the Flutter Application

```bash
flutter run
```

### Payment Flow

1. **Select a Service**: On the initial screen, choose one of the available services
2. **Enter M-Pesa Number**: Type a valid phone number
3. **Confirm Payment**: Click "Pay with M-Pesa"
4. **Authorize on Device**: Confirm the transaction with your M-Pesa PIN
5. **See Success**: After confirmation, you'll see the success screen

## 📁 Project Structure

```
teste01/
├── lib/
│   ├── main.dart                 # Application entry point
│   ├── screens/
│   │   ├── services_page.dart    # Services screen
│   │   ├── checkout_page.dart    # Payment screen
│   │   ├── payment_success_page.dart
│   │   ├── settings_page.dart    # About the project
│   │   └── mpesa_service.dart    # Payment service
│   └── services/
│       └── mpesa_service.dart    # API integration
├── backend_pay/
│   ├── server.js                 # Main server
│   ├── mpesaService.js           # M-Pesa logic
│   ├── package.json
│   ├── .env.example
│   └── .env                      # Environment variables
├── assets/
│   └── images/
│       └── mpesa_logo.svg
└── README.md
```

## 🔐 Security

- ⚠️ **Never share your `.env` file** - it contains sensitive credentials
- The `.env` is included in `.gitignore`
- Always use `youripaddress` as a placeholder
- Validate all phone numbers on the backend

## 🌍 Production Configuration

To use in production with real M-Pesa:

1. Change `MPESA_BASE_URL` to the official URL (remove sandbox)
2. Update credentials to production
3. Configure HTTPS for all requests
4. Implement robust authentication and validation

## 🤝 Contributing

Suggestions and improvements are welcome! Create an issue or pull request.

## 📝 License

This project is provided as an implementation example.

## 👨‍💻 Developer

**Vlad Van Nguila**

> Created to make it easier for developers to integrate M-Pesa into their Flutter applications.

## 📞 Support

If you encounter any questions during integration:
1. Check the official M-Pesa documentation
2. Verify that your credentials are correct
3. Check the backend logs
4. Make sure the server is running

---

Version: 1.0.0

---

# Flutter M-Pesa Integration - Exemplo de Implementação

> Uma implementação clara e bem documentada da integração com a API de pagamento M-Pesa para desenvolvedores Flutter.

## 📋 Visão Geral

Este projeto foi criado para facilitar a integração da API de pagamento M-Pesa em aplicações Flutter. A documentação oficial era difícil de encontrar e desorganizada, então foi desenvolvida esta solução completa para ajudar outros desenvolvedores.

##  Funcionalidades

-  Integração completa com API M-Pesa
-  Interface limpa e intuitiva
-  Validação de números de telefone
-  Confirmação de pagamento
-  Página de sucesso com detalhes da transação
-  Backend Node.js incluído

## 📱 Telas da Aplicação

### 1. Tela de Serviços
A tela inicial mostra os serviços disponíveis para pagamento.

![Tela de Serviços](./assets/images/screenshots/1.png)

### 2. Tela de Pagamento
Formulário para inserir o número M-Pesa e confirmar o pagamento.

![Tela de Pagamento](./assets/images/screenshots/2.png)

### 3. Notificação M-Pesa
Confirmação de pagamento recebida no dispositivo.

![Notificação M-Pesa](./assets/images/screenshots/4.jpeg)

### 4. Tela de Sucesso
Confirmação da transação completada com detalhes.

![Tela de Sucesso](./assets/images/screenshots/3.png)

## 🚀 Instalação

### Pré-requisitos
- Flutter SDK (3.11.5 ou superior)
- Node.js (para o backend)
- Credenciais M-Pesa válidas

### Passos de Instalação

1. **Clone o repositório**
```bash
git clone https://github.com/Hunchovan/flutter-mpesa-api-c2b.git
cd teste01
```

2. **Configure as variáveis de ambiente**

Crie um arquivo `.env` na pasta `backend_pay/`:

```env
MPESA_API_KEY=sua_api_key_aqui
MPESA_PUBLIC_KEY=sua_public_key_aqui
MPESA_SERVICE_PROVIDER_CODE=seu_codigo_aqui
MPESA_BASE_URL=https://api.sandbox.vm.co.mz:18352
```

Use `.env.example` como referência.

3. **Instale as dependências Flutter**
```bash
flutter pub get
```

4. **Instale as dependências do backend**
```bash
cd backend_pay
npm install
```

5. **Configure o endereço do servidor**

No arquivo `lib/screens/checkout_page.dart`, substitua `youripaddress` pelo IP do seu servidor:

```dart
final mpesaService = MpesaService(backendUrl: 'http://seu_ip:3000');
```

## 🛠️ Como Usar

### Iniciando o Backend

```bash
cd backend_pay
node server.js
```

O servidor rodará na porta 3000.

### Rodando a Aplicação Flutter

```bash
flutter run
```

### Fluxo de Pagamento

1. **Selecione um Serviço**: Na tela inicial, escolha um dos serviços disponíveis
2. **Insira o Número M-Pesa**: Digite um número de telefone válido
3. **Confirme o Pagamento**: Clique em "Pagar com M-Pesa"
4. **Autorize no Dispositivo**: Confirme a transação com seu PIN M-Pesa
5. **Veja o Sucesso**: Após confirmação, você verá a tela de sucesso

## 📁 Estrutura do Projeto

```
teste01/
├── lib/
│   ├── main.dart                 # Entrada da aplicação
│   ├── screens/
│   │   ├── services_page.dart    # Tela de serviços
│   │   ├── checkout_page.dart    # Tela de pagamento
│   │   ├── payment_success_page.dart
│   │   ├── settings_page.dart    # Sobre o projeto
│   │   └── mpesa_service.dart    # Serviço de pagamento
│   └── services/
│       └── mpesa_service.dart    # Integração com API
├── backend_pay/
│   ├── server.js                 # Servidor principal
│   ├── mpesaService.js           # Lógica M-Pesa
│   ├── package.json
│   ├── .env.example
│   └── .env                      # Variáveis de ambiente
├── assets/
│   └── images/
│       └── mpesa_logo.svg
└── README.md
```

## 🔐 Segurança

- ⚠️ **Nunca compartilhe seu arquivo `.env`** - ele contém credenciais sensíveis
- O `.env` está incluído no `.gitignore`
- Sempre use `youripaddress` como placeholder
- Valide todos os números de telefone no backend

## 🌍 Configuração para Produção

Para usar em produção com M-Pesa real:

1. Altere `MPESA_BASE_URL` para a URL oficial (remova sandbox)
2. Atualize as credenciais para produção
3. Configure HTTPS para todas as requisições
4. Implemente autenticação e validação robusta

## 🤝 Contribuindo

Sugestões e melhorias são bem-vindas! Crie uma issue ou pull request.

## 📝 Licença

Este projeto é fornecido como exemplo de implementação.

## 👨‍💻 Desenvolvedor

**Vlad Van Nguila**

> Criado para facilitar a vida dos desenvolvedores integrando M-Pesa em suas aplicações Flutter.

## 📞 Suporte

Se encontrar dúvidas na integração:
1. Verifique a documentação oficial do M-Pesa
2. Confirme que suas credenciais estão corretas
3. Verifique os logs do backend
4. Certifique-se de que o servidor está rodando

---

Versão: 1.0.0
