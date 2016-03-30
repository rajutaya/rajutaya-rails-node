var express = require('express');
var router = express.Router();
var i18n = require('i18n');
var ProjectController = require('../controllers/ProjectController');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

/*user details*/
router.get('/user_details', function (req, res) {
  // res.send('Got a Get request at /user_details');
  res.render('user_details', {title: "User Details"});
});

router.get('/get_node_search', function(req, res){
	ProjectController.get_node_search(req, res);
});

module.exports = router;
