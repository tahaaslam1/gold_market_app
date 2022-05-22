//const config = require('config');
const express = require('express');
const Joi = require('joi');
const mongoose = require('mongoose');
const users = require('./routes/users');
const auth = require('./routes/auth');
const items = require('./routes/items');
const inventories = require('./routes/inventories');


const app = express();

mongoose.connect('mongodb+srv://goldzoid:hassan1234@cluster0.oypzj.mongodb.net/?retryWrites=true&w=majority')
        .then(() => console.log('Successfully connected to the database!'))
        .catch(err => console.log('Couldnt connect'));


app.use(express.json());
app.use('/api/user', users);
app.use('/api/user', auth);
app.use('/api/user', items);
app.use('/api/user',inventories);
//app.use('')


const port = (process.env.PORT || 7000);
app.listen(port, () =>{
    console.log(`Listening at port : ${port}`);
    

});