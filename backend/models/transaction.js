const mongoose = require('mongoose');
const { itemSchema } = require('./item');

const transactionSchema = mongoose.Schema({

    type: {
        type: String,
        required: true
    },

    wastage: {
        type: Number,
        required: true
    },
    labour: {
        type: Number,
        required: true
    },
    item: {
        type: itemSchema,
        required: true
    },

    dateTime: {
        type: Date,
        required: true
    },

    transactionFinalAmount: {
        type: Number,
        required: true
    }
});

const Transaction = mongoose.model('Transaction', transactionSchema);


module.exports.Transaction = Transaction;
