const { Client } = require('pg');

const config = {
  user: 'postgres',
  password: 'postgres',
  host: 'localhost',
  port: 5432,
  database: 'pfe-2024-1_lessons'
}

const client = new Client(config);

const user = {
  firstName: 'Insert',
  lastName: 'Insertovich',
  email: 'inserter@mail.com',
  accountBalance: 250,
  height: 1.67,
  isMale: true,
  birthday: '1980-07-15',
}

async function startScript() {

  await client.connect();

  const res = await client.query(`
    INSERT INTO users (
      first_name,
      last_name,
      email,
      is_male,
      height,
      account_balance,
      birthday
    ) VALUES
    ('${user.firstName}', '${user.lastName}',' ${user.email}', ${user.isMale}, ${user.height}, ${user.accountBalance}, '${user.birthday}')
    RETURNING *;
  `);
  
  // console.log(res); // res.rows - резульатати запиту (користувачі)

  console.log(res.rows[0]);
  
  await client.end();
}

startScript();