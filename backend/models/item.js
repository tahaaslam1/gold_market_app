const mongoose = require('mongoose');
const {materialSchema} = require('./material');
const Joi = require('Joi');
const { inventorySchema } = require('./inventory');



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

function calculatetotalGold(item){

    var tg , sum = 0;
    for(i in item){
        tg =  item[i].weightInGramsPerUnit * item[i].qty ;
        
        sum+=tg ;
        // console.log(sum);
    }  
    return sum;
}

function calculateTotalgoldValue(item){
   var sum = 0;
    for (i in item){

        sum += item[i].itemValue;
    }
    return sum;

}

module.exports.Item = Item;
module.exports.itemSchema = itemSchema;
module.exports.calculatetotalGold = calculatetotalGold;
module.exports.calculateTotalgoldValue = calculateTotalgoldValue;
    
// }