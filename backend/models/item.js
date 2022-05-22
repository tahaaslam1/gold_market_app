const mongoose = require('mongoose');
const {materialSchema} = require('./material');
const Joi = require('Joi');



const itemSchema = new mongoose.Schema({

    type : {
        type : String,
        required : false
    }, 

    material : {
        type : materialSchema,
        required : false
        
    },

    qty : {
        type : Number,
        required : false
        
    },
    weightInGramsPerUnit : {
        type : Number,
        required : false
    },

    itemValue : {
        type : Number,
        required : false
    },
    karrot : {
        type : Number,
        required : false
    }

});

const Item = mongoose.model('Item', itemSchema);

// function validateItem(item){



module.exports.Item = Item;
module.exports.itemSchema = itemSchema;
    
// }