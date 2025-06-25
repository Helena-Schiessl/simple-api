# 📘 simple-api

API Node.js com Express que realiza conexão com PostgreSQL hospedado na AWS RDS.

---

## 📝 Descrição

Uma API em Node.js utilizando o Express Framework que realiza a conexão com um banco de dados PostgreSQL.

---

## ▶️ Como utilizar

O comando para iniciar a API é:

```bash
npm run start
```

> Ou diretamente com:  
```bash
node src/index.js
```

---

## 📌 Rotas

| Rota     | Método | Descrição                                                                 |
|----------|--------|---------------------------------------------------------------------------|
| `/`      | GET    | Retorna uma mensagem estática.                                            |
| `/connect` | GET | Realiza a conexão com o banco e retorna a versão da engine.               |
| `/db`    | GET    | Retorna a hora atual via `SELECT NOW()`                                   |

---

## 🔐 Variáveis de Ambiente

| Nome          | Description                 | Padrão                            |
|---------------|-----------------------------|-----------------------------------|
| `API_PORT`    | Porta da API Node           | `3000`                            |
| `DB_DATABASE` | Database do banco de dados  | `postgres`                        |
| `DB_HOST`     | Endereço do banco de dados  | `postgres-db.xxxx.rds.amazonaws.com` |
| `DB_PORT`     | Porta do banco de dados     | `5432`                            |
| `DB_USER`     | Usuário do banco de dados   | `testekxc`                        |
| `DB_PASSWORD` | Senha do banco de dados     | `***********` (usar no `.env`)    |

---

## 🚀 Tecnologias

- Node.js
- Express
- PostgreSQL
- AWS RDS
- dotenv

---

## 🙋‍♀️ Desenvolvedora

Helena Schiessl  
[linkedin.com/in/helenaschiessl](https://www.linkedin.com/in/helenaschiessl/)
