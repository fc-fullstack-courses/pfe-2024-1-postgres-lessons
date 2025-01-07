const { Client } = require('pg');

const config = {
  user: 'postgres',
  password: 'postgres',
  host: 'localhost',
  port: 5432,
  database: 'pfe-2024-1_lessons',
};

const client = new Client(config);

const user = {
  firstName: 'Insert',
  lastName: 'Insertovich',
  email: 'inserter@mail.com',
  accountBalance: 250,
  height: 1.67,
  isMale: true,
  birthday: '1980-07-15',
};

const users = [
  {
    firstName: 'Insert 1',
    lastName: 'Insertovich 1',
    email: 'inserter1@mail.com',
    accountBalance: 552245,
    height: 1.67,
    isMale: false,
    birthday: '1995-11-02',
  },
  {
    firstName: 'Insert 2',
    lastName: 'Insertovich 2',
    email: 'inserter2@mail.com',
    accountBalance: 0,
    height: 1.98,
    isMale: false,
    birthday: '1988-04-28',
  },
  {
    firstName: 'Insert 3',
    lastName: 'Insertovich 3',
    email: 'inserter3@mail.com',
    accountBalance: 6500,
    height: 1.58,
    isMale: true,
    birthday: '1980-03-03',
  },
];

function mapUser(user) {
  return `('${user.firstName}', '${user.lastName}',' ${user.email}', ${user.isMale}, ${user.height}, ${user.accountBalance}, '${user.birthday}')`;
}

const usersInsertStringsArray = users.map(mapUser);

// console.log(usersInsertStringsArray);

const usersInsertString = usersInsertStringsArray.join(',');

// console.log(usersInsertString);

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
    ${usersInsertString}
    RETURNING *;
  `);

  // console.log(res); // res.rows - резульатати запиту (користувачі)

  console.log(res.rows[0]);

  await client.end();
}

startScript();
