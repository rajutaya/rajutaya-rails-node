var Project = require("../models/Project");

exports.get_node_search = function(request, response) {
	console.log('i am controller');
	console.log(request.param('keywords'));
	Project.get_node_search(request, function(results){
		response.json({
			"options":results
		});
   });
};