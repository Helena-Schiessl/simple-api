const express = require('express');
const { Pool } = require('pg');

const app = express();
const port = 3000;

// Conexão com o banco PostgreSQL usando variáveis de ambiente
const pool = new Pool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_DATABASE,
  port: 5432,
});

// Teste de conexão com o banco
pool.connect((err, client, release) => {
  if (err) {
    return console.error('Erro na conexão com o banco:', err);
  }
  console.log('Conectado ao banco PostgreSQL!');
  release();
});

// Rota principal
app.get('/', (req, res) => {
  res.send('API funcionando com sucesso!');
});

// Rota para testar o banco
app.get('/db', async (req, res) => {
  try {
    const result = await pool.query('SELECT NOW()');
    res.json({ time: result.rows[0] });
  } catch (error) {
    console.error('Erro na consulta:', error);
    res.status(500).send('Erro na conexão com o banco');
  }
});

// Inicializa o servidor
app.listen(port, () => {
  console.log(`Servidor rodando na porta ${port}`);
});
