require('dotenv').config();

const express = require('express');
const cors = require('cors');
const MpesaService = require('./mpesaService');

const app = express();
const mpesaService = new MpesaService();

app.use(cors());
app.use(express.json());

app.get('/', (req, res) => {
  res.send('Backend Teste01 online');
});

app.post('/api/mpesa/c2b', async (req, res) => {
  try {
    const { phone, amount, serviceName } = req.body;

    if (!phone || !amount) {
      return res.status(400).json({
        success: false,
        message: 'phone e amount são obrigatórios',
      });
    }

    const result = await mpesaService.c2bPayment({
      phone,
      amount,
      serviceName,
    });

    return res.status(200).json({
      success: true,
      data: result,
    });
  } catch (error) {
    return res.status(error.response?.status || 500).json({
      success: false,
      message: error.response?.data || error.message,
    });
  }
});

app.listen(3000, '0.0.0.0', () => {
  console.log('Backend Teste01 rodando na porta 3000');
});
