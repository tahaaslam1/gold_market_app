//const config = require('config');
const express = require('express');
const Joi = require('joi');
const mongoose = require('mongoose');
const users = require('./routes/users');
const auth = require('./routes/auth');

const app = express();

mongoose.connect('mongodb+srv://goldzoid:goldzoid12345@cluster0.oypzj.mongodb.net/GoldZoid?retryWrites=true&w=majority')
        .then(() => console.log('Successfully connected to the database!'))
        .catch(err => console.log('Couldnt connect'));


app.use(express.json());
app.use('/api/signup', users);
app.use('/api/login', auth);


const port = (process.env.PORT || 3000);
app.listen(port, () =>{
    console.log(`Listening at port : ${port}`);

});