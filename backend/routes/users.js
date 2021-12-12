const express= require('express');
const router = express.Router();
const {User, validate} = require('../models/user');
const bcrypt = require('bcrypt');
//const config = require('config');
const _ = require('lodash');


router.post('/', async(req,res)=>{

    const validation = validate(req.body);
    if(validation.error) return res.status(400).send(validation.error.details[0].message);

    //for already registered user

    let user = await User.findOne({emailId : req.body.emailId});
    if(user) return res.status(400).send('User Already Registered');

    //if user not registered
    user = new User(_.pick(req.body,['name','emailId','password']));

    const salt = await bcrypt.genSalt(10);
    user.password= await bcrypt.hash(user.password,salt);

    user = await user.save()
            .then(() => {
                res.status(200).json('Successfully signed up');
            })
            .catch((err) => {
                res.status(400).json(err);
            })


});

module.exports = router;