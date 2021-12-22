const express = require('express');
const router = express.Router();
const { Item, calculatetotalGold, calculateTotalgoldValue } = require('../models/item');
const { User } = require('../models/user');
const { Material } = require('../models/material');
const { Inventory } = require('../models/inventory');
const _ = require('lodash');
const { Mongoose } = require('mongoose');


//items temp list
//console.log(a);
var a = [];
router.post('/additems', async (req, res) => {


    let user = await User.findOne({ emailId: req.body.emailId });
    if (!user) res.status(400).send('User not Found!');

    else {
        let items = new Item({

            type: req.body.items.type,
            material: new Material({

                type: req.body.items.material.type,
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

            items: items

        });

        inventory.items = a;

        var sum_totalgold = calculatetotalGold(inventory.items); // calculating totalGold
        inventory.totalGold = sum_totalgold;

        var sum_goldval = calculateTotalgoldValue(inventory.items);
        inventory.totalGoldValue = sum_goldval;
        await inventory.save();
        user.inventory = inventory;
        //console.log(inventory.items);
        await user.save();
        //res.status(200).json({"Response":"Item Added"});
        res.status(200).json({
            "Response": "Item Added",
            "_id": items._id,
            "itemValue": items.itemValue,
            "material": items.material,
            "qty": items.qty,
            "type": items.type,
            "weightInGramsPerUnit": items.weightInGramsPerUnit,
            "karrot": items.karrot
        })
        //res.json(user);
    }
});

//qty,weightInGramsPerUnit, karrot
//update item
router.put("/updateitem/:id1/:id2/:id3", async (req, res) => {

    let user = await User.findById(req.params.id1);
    let item = await Item.findByIdAndUpdate(req.params.id3, {     //updating in item schema

        qty: req.body.qty,
        weightInGramsPerUnit: req.body.weightInGramsPerUnit,
        karrot: req.body.karrot
    });
    await item.save();
    let inventory = user.inventory.items;   //updating in use schema
    var id = req.params.id3;  //item id

    for (var i in inventory) {

        if (id === inventory[i]._id.toString()) {

            inventory[i].qty = req.body.qty;
            inventory[i].weightInGramsPerUnit = req.body.weightInGramsPerUnit;
            inventory[i].karrot = req.body.karrot;
        }
    }

    let inv = await Inventory.findById(req.params.id2);          //updating in inventory schema

    let temp = inv.items;
    for (var j in temp) {
        if (id === temp[j]._id.toString()) {
            temp[j].qty = req.body.qty;
            temp[j].weightInGramsPerUnit = req.body.weightInGramsPerUnit;
            temp[j].karrot = req.body.karrot;
        }
    }
    await inv.save();


    await user.save();
    res.json(user);

});

router.get('/getItemList/:id', async (req, res) => {

    const user = await User.findById(req.params.id);
    res.json(user.inventory.items);
});

router.delete('/deleteitem/:id1/:id2/:id3', async (req, res) => {

    let user = await User.findById(req.params.id1);
    if (!user) res.status(200).json('User not found');
    var item_id = req.params.id3;

    var c = user.inventory.items;
    // console.log(c);
    for (var i = 0; i < c.length; i++) {  //removing from user schema

        if (c[i]._id.toString() === item_id)
            c.splice(i, 1);


    }
    user.inventory.items = c;
    var sum_totalgold = calculatetotalGold(user.inventory.items); // calculating totalGold updating user's inventory
    user.inventory.totalGold = sum_totalgold;

    var sum_goldval = calculateTotalgoldValue(user.inventory.items);
    user.inventory.totalGoldValue = sum_goldval;

    await user.save();


    await Item.findByIdAndRemove(item_id); //removing from item schema
    // if(!item) res.status(200).json('Item not Found');
    let inventory = await Inventory.findById(req.params.id2);
    var d = inventory.items;

    for (var j = 0; j < d.length; j++) {        //removing from inventory schema
        if (d[j]._id.toString() === item_id)
            d.splice(j, 1);
    }

    inventory.items = d;

    inventory.totalGold = sum_totalgold;  //updating inventory schema
    inventory.totalGoldValue = sum_goldval;
    await inventory.save();
    //res.json(user);
    // res.send('ok');
    res.status(200).json({ "Response": "Item Deleted" });

    var temp;
    temp = a;
    for (k in a) {
        if (temp[k]._id.toString() === item_id)
            a.splice(k, 1);
    }
});

module.exports = router;
