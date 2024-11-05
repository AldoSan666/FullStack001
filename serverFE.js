const express  = require('express');
const path = require('path');
const app = express();
const port = process.env.port || 4000;

app.use(express.static('public'));

app.get('/', (req, res)=> {
    res.sendFile(path.join(__dirname,'public','FrontEnd.html'));
});

app.listen(port, () =>{
    console.log('Server Running on http://localhost:${port}');
});