const mongoose = require('mongoose');
const Joi = require('Joi');
const {materialSchema} = require('./material');


const itemSchema = new mongoose.Schema({

    type : {
        type : String,
        required : true
    },

    material : {
        type : materialSchema,
        required : true
    },

    qty : {
        type : Number,
        required : true
        
    },
    weightInGramsPerUnit : {
        type : Number,
        required : true
    },

    itemValue : {
        type : Number,
        required : true
    },
    karrot : {
        type : Number,
        required : true
    }

});

const Item = mongoose.model('Item', itemSchema);

function validateItem(item){




    
}