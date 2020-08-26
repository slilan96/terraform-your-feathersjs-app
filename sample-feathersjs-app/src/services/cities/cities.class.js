const { Service } = require('feathers-knex');

exports.Cities = class Cities extends Service {
  constructor(options) {
    super({
      ...options,
      name: 'cities'
    });
  }
};
