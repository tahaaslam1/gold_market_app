const express= require('express');
const router = express.Router();
const {User, validate} = require('../models/user');
const bcrypt = require('bcrypt');
//const config = require('config');
const _ = require('lodash');


router.post('/signup', async(req,res)=>{

    const validation = validate(req.body);
    if(validation.error) return res.status(400).json(validation.error.details[0].message);

    //for already registered user

    let user = await User.findOne({emailId : req.body.emailId});
    if(user) return res.status(400).json({"Response" : 'User Already Registered', "userId" : null, "emailId" : null, "name" : null, "profileUrl" : null});

    //if user not registered
    user = new User(_.pick(req.body,['name','emailId','password']));

    const salt = await bcrypt.genSalt(10);
    user.password= await bcrypt.hash(user.password,salt);

    user = await user.save()
            .then(() => {
                res.status(200).json({"Response" : 'Successfully signed up', "userId" : user._id, "emailId" : user.emailId, "name" : user.name, "profileUrl" : user.profileUrl, "inventory" : user.inventory});
            })
            .catch((err) => {
                res.status(400).json(err);
            })


});

//updating name and profileurl
router.put('/updateUserName/:id', async(req,res) =>{

    
    const user = await User.findByIdAndUpdate(req.params.id, {

        name : req.body.name,
    });
    
    if(user.name != "") res.json({"Response" : "Updated User Name"});

    else
    res.json({"Response" : "Text Field should not be empty"});


   

});
router.put('/updateProfileUrl/:id', async(req,res) =>{

    
    const user = await User.findByIdAndUpdate(req.params.id, {
        
        profileUrl : req.body.profileUrl
    });
    
    if(user.profileUrl != "") res.json({"Response" : "Updated Profile Url"});

    else
    res.json({"Response" : "Text Field should not be empty"});


   

});


router.post('/getuserdetails', async(req,res)=>{ //kaam krna he


    let user = await User.findOne({emailId : req.body.emailId});
    if(!user) return res.status(400).json({"Response" : 'User not found'});

    res.json((_.pick(user,['_id','emailId', 'name','profileUrl','inventory'])));
    
});


// router.get('')

module.exports = router;