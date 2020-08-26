const cities = require('./cities/cities.service.js');
// eslint-disable-next-line no-unused-vars
module.exports = function (app) {
  app.configure(cities);
};
