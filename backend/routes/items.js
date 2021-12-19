const express = require('express');
const router = express.Router();
const { Item } = require('../models/item');
const { User } = require('../models/user');
const { Material} = require('../models/material');
const { Inventory } = require('../models/inventory');
const _ = require('lodash');

var a = []; //items temp list
router.post('/additems', async (req, res) => {


    let user = await User.findOne({ emailId: req.body.emailId });
    if(!user) res.status(400).send('User not Found!');

    else{

        
       let items  =  new Item({

            type: req.body.items.type,
            material: new Material({

                type : req.body.items.material.type,
                valuePerOunce: req.body.items.material.valuePerOunce

            }),
            qty: req.body.items.qty,
            weightInGramsPerUnit: req.body.items.weightInGramsPerUnit,
            itemValue: req.body.items.itemValue,
            karrot: req.body.items.karrot
        });
    
       await items.save();
    
       a.push(items);

       let inventory = new Inventory({

        items : items

       });

inventory.items = a;
      
     await inventory.save();

     user.inventory = inventory;
    
    
     await user.save();
    res.json(user);
    }

});

//qty,weightInGramsPerUnit, karrot
//update item
router.put("/updateitem/:id", async(req,res)=>{

    let item = Item.findByIdAndUpdate(req.params.id,{

        qty : req.body.qty,
        weightInGramsPerUnit : req.body.weightInGramsPerUnit,
        karrot : req.body.karrot

    });

    if(!item) res.status(400).json("Response : Item not Found");

    res.json(item);

    
});


module.exports = router;
