const express = require('express');
const router = express.Router();
const {User} = require('../models/user');
const _ = require('lodash');
const bcrypt = require('bcrypt');


router.post('/login', async (req,res) =>{

    //authenticating email

    let user = await User.findOne({emailId : req.body.emailId});

    if(!user) return res.status(400).json({"Response" : 'Invalid Email or Password', "_id" : null, "emailId" : null, "name" : null, "profileUrl" : null});

    //authenticating password

    const validPassword = await bcrypt.compare(req.body.password, user.password);

    if(!validPassword) return res.status(400).json({"Response" : 'Invalid Email or Password', "_id" : null, "emailId" : null, "name" : null, "profileUrl" : null});

    res.json({"Response" : 'Successfully Logged In', "_id" : user._id, "emailId" : user.emailId, "name" : user.name, "profileUrl" : user.profileUrl, "inventory" : user.inventory});

});  

module.exports = router;