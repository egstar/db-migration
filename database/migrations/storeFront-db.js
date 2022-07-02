import fs from 'fs';
import path from 'path';

let dbm;
let type;


/**
  * We receive the dbmigrate dependency from dbmigrate initially.
  * This enables us to not have to rely on NODE_PATH.
  */
exports.setup = function(options) {
  dbm = options.dbmigrate;
  type = dbm.datatype;
};

exports.up = function(db, callback) {
  var filePath = path.join(__dirname + './sqls/storeFront-db-up.sql');
  fs.readFile(filePath, {encoding: 'utf-8'}, function(err,data){
    if (err) return console.log(err);
    db.runSql(data, function(err) {
      if (err) return console.log(err);
      callback();
    });
  });
};

exports.down = function(db, callback) {
  var filePath = path.join(__dirname + './sqls/storeFront-db-down.sql');
  fs.readFile(filePath, {encoding: 'utf-8'}, function(err,data){
    if (err) return console.log(err);
    db.runSql(data, function(err) {
      if (err) return console.log(err);
      callback();
    });
  });
};
