var mysql = require('mysql');
var request = require("request");

exports.get_node_search = function(req, callback) {
	console.log('i am model');
	console.log(req.param('keywords'));
	params_value = "'%"+req.param('keywords') +"%'";
	sql_name = "select first_name as label from test_projects where first_name LIKE "+params_value+';';
	console.log(sql_name);
	sql_query = mysql.format(sql_name);

	req.getConnection(function(err, connection) {
    if (err) {
      console.error('CONNECTION error: ', err);
      return callback({"error": err, "status": 500});
    }
    else {
      connection.query(sql_query, function(err, rows) {
        if(err) {
          console.log("Error Selecting : %s ", err);
          return callback({"error": err, "status": 500});
        }
        else {
           return callback({"options": rows, "status": 200});
        }
      });
    }
  });
}