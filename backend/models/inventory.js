const mongoose = require('mongoose');
const {itemSchema} = require('./item');

const inventorySchema = new mongoose.Schema({

    totalGold : {

        type : String,
        required : true
    },

    totalGoldValue : {

        type : Number,
        required : true
    },

    items : {
        type : [itemSchema],
        required : true
    }


});

const Inventory = mongoose.model('Inventory', inventorySchema);




