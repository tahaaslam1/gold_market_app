const mongoose = require('mongoose');
const {itemSchema} = require('./item');

const inventorySchema = new mongoose.Schema({

    totalGold : {

        type : Number,
        //required : true
        default : null
    },

    totalGoldValue : {

        type : Number,
        default : null
        //required : true
    },

    items : {
        type : [itemSchema]
        //required : true
    }


});

const Inventory = mongoose.model('Inventory', inventorySchema);



module.exports.Inventory = Inventory;
module.exports.inventorySchema = inventorySchema;
