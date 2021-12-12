const express = require('express');
const router = express.Router();
const {User} = require('../models/user');
const _ = require('lodash');
const bcrypt = require('bcrypt');


router.post('/', async (req,res) =>{

    //authenticating email

    let user = await User.findOne({emailId : req.body.emailId});

    if(!user) return res.status(400).json('Invalid Email or Password');

    //authenticating password

    const validPassword = await bcrypt.compare(req.body.password, user.password);

    if(!validPassword) return res.status(400).json('Invalid Email or Password');

    res.json('Login Success!');

});

module.exports = router;