const mongoose = require('mongoose')
const {inventorySchema} = require('./inventory');
const Joi = require('joi');
//const jwt = require('jsonwebtoken');
//const config = require('config');
const passwordComplexity = require('joi-password-complexity');

//const {transactionSchema} = require('./transaction');


const userSchema = new mongoose.Schema({

   
    emailId : {
        type: String,
        required : true,
        unique : true,
        min : 5,
        max : 255

    },

    password : {
        type : String,
        required : true,
    },
    name : {
        type : String,
        required : true,
        min :5,
        max : 255

    },
    profileUrl : {
        type : String,
        default : 'https://cdn4.iconfinder.com/data/icons/small-n-flat/24/user-alt-512.png'  
    },
    inventory : {
        type : inventorySchema,
        default : mongoose.SchemaTypes
        //default : null
        //required : fale,
     }
});

// userSchema.methods.generateAuthToken = function(){           //generate JWT

//     const token = jwt.sign({_id : this._id},config.get('PrivateKey'));
//     return token;
// }

const User = mongoose.model('User', userSchema);

function validateUser(user){

    const schema = Joi.object({
        name : Joi.string().min(5).max(255).required(),
        emailId : Joi.string().min(5).max(255).required(),
        password : new passwordComplexity({
            min : 8,
            max : 12,
            lowerCase : 1,
            numeric : 1,
            symbol : 1,
        }),
        // phone : Joi.string().min(11).max(13).required()

    });
    return schema.validate(user);
}

module.exports.User = User;
module.exports.validate = validateUser;
