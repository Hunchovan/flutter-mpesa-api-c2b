const axios = require('axios');
const forge = require('node-forge');

class MpesaService {
  constructor() {
    this.apiKey = process.env.MPESA_API_KEY;
    this.publicKey = process.env.MPESA_PUBLIC_KEY;
    this.serviceProviderCode = process.env.MPESA_SERVICE_PROVIDER_CODE;
    this.baseUrl = process.env.MPESA_BASE_URL;
  }

  generateBearerToken() {
    const publicKeyPem =
      `-----BEGIN PUBLIC KEY-----\n${this.publicKey}\n-----END PUBLIC KEY-----`;

    const publicKey = forge.pki.publicKeyFromPem(publicKeyPem);
    const encrypted = publicKey.encrypt(this.apiKey, 'RSAES-PKCS1-V1_5');

    return forge.util.encode64(encrypted);
  }

  async c2bPayment({ phone, amount, serviceName }) {
    const token = this.generateBearerToken();

    const body = {
      input_TransactionReference: `T${Date.now()}`.substring(0, 20),
      input_CustomerMSISDN: phone,
      input_Amount: amount,
      input_ThirdPartyReference: `REF${Date.now()}`.substring(0, 20),
      input_ServiceProviderCode: this.serviceProviderCode,
    };

    const response = await axios.post(
      `${this.baseUrl}/ipg/v1x/c2bPayment/singleStage/`,
      body,
      {
        headers: {
          'Content-Type': 'application/json',
          Authorization: `Bearer ${token}`,
          Origin: 'developer.mpesa.vm.co.mz',
        },
        timeout: 60000,
      }
    );

    return response.data;
  }
}

module.exports = MpesaService;
