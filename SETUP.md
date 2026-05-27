# Como Preparar este Projeto para Compartilhar

## 📸 Captura de Telas (Screenshots)

Este projeto inclui documentação com capturas de telas em:
- `screenshots/1.png` - Tela de Serviços
- `screenshots/2.png` - Tela de Pagamento
- `screenshots/4.jpeg` - Notificação M-Pesa
- `screenshots/4.png` - Tela de Sucesso

Copie suas capturas para a pasta `screenshots/` para que o README as exiba corretamente.

## 🔧 Preparação Final

### 1. Remover Informações Pessoais
- ✅ IP do servidor já foi substituído por `youripaddress`
- ✅ Arquivo `.env` está no `.gitignore`
- ✅ Use `.env.example` como template

### 2. Testar Antes de Compartilhar

```bash
# Teste o backend
cd backend_pay
npm install
node server.js

# Em outro terminal, teste o Flutter
flutter pub get
flutter run
```

### 3. Adicionar Credenciais de Teste

Crie um arquivo `.env.example` com a estrutura:
```env
MPESA_API_KEY=your_api_key_here
MPESA_PUBLIC_KEY=your_public_key_here
MPESA_SERVICE_PROVIDER_CODE=your_code_here
MPESA_BASE_URL=https://api.sandbox.vm.co.mz:18352
```

## 📝 Documentação Incluída

- **README.md** - Documentação em Inglês e Português
- **README_PT.md** - Versão completa em Português
- **.env.example** - Template para variáveis de ambiente
- **SETUP.md** - Este arquivo

## 🚀 Pronto para Compartilhar!

Seu projeto está pronto para ser:
- ✅ Publicado no GitHub
- ✅ Compartilhado com outros desenvolvedores
- ✅ Usado como referência de integração M-Pesa

## 💡 Dicas para Outros Desenvolvedores

1. Sempre comece pelo `.env.example`
2. Substitua `youripaddress` pelo IP real do servidor
3. Valide os números de telefone com o formato correto
4. Use a sandbox do M-Pesa para testes
5. Ative HTTPS em produção

---

Desenvolvido por: **Vlad Van Nguila**
Data: 2026
