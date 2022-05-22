const mongoose = require('mongoose');
const {itemSchema} = require('./item');

const inventorySchema = new mongoose.Schema({

    totalGold : {

        type : String,
        //required : true
        default : '0.0'
    },

    totalGoldValue : {

        type : String,
        default : '0.0'
        //required : true
    },

    items : {
        type : [itemSchema],
        //required : true
    }


});

const Inventory = mongoose.model('Inventory', inventorySchema);



module.exports.Inventory = Inventory;
module.exports.inventorySchema = inventorySchema;
