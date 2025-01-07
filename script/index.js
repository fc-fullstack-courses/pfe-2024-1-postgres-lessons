const { Client } = require('pg');

const config = {
  user: 'postgres',
  password: 'postgres',
  host: 'localhost',
  port: 5432,
  database: 'pfe-2024-1_lessons'
}

const client = new Client(config);

async function startScript() {

  await client.connect();

  const res = await client.query('SELECT * FROM users;');
  
  console.log(res); // res.rows - резульатати запиту (користувачі)
  
  await client.end();
}

startScript();