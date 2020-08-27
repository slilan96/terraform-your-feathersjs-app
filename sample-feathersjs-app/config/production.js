module.exports = {
  host: process.env.HOST,
  port: process.env.PORT,
  public: '../public/',
  paginate: {
    default: 10,
    max: 50
  },
  postgres: {
    client: 'pg',
    connection: process.env.DATABASE_URL,
  }
};
