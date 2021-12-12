const mongoose = require('mongoose');
const joi = require('Joi');

const materialSchema = new mongoose.Schema({

    materialType : {
        type : String,
        required : true
    },
    valuePerOunce : {
        type : Number,
        required : true
    }

});

const Material = mongoose.model('Material', materialSchema);

function validateMaterial(material){

    
}

