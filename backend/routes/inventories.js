const express = require('express');
const router = express.Router();
const { Item } = require('../models/item');
const { User } = require('../models/user');
const { Material} = require('../models/material');
const { Inventory } = require('../models/inventory');
const _ = require('lodash');

router.get('/getinventory/:id', async(req,res)=>{

    
    const user = await User.findById(req.params.id);
    
    if(!user) return res.status(400).json('user not found');

    const inventory = user.inventory;
 
    res.status(200).json({"_id" : inventory._id,"totalGold" : inventory.totalGold, "totalGoldValue" : inventory.totalGoldValue, "items" : inventory.items});

});


module.exports = router;