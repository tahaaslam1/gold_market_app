const mongoose = require('mongoose');
const joi = require('Joi');

const materialSchema = new mongoose.Schema({

    materialType : {
        type : String,
        default : "gold"
    },
    valuePerOunce : {
        type : Number,
        //default : null,
        required : false
    }

});

const Material = mongoose.model('Material', materialSchema);

// function validateMaterial(material){

module.exports.Material = Material;
module.exports.materialSchema = materialSchema;
    
// }

