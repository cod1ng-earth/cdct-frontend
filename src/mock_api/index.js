
const http = require('http');
const port = process.env.PORT || 3000;


//create a server object:
const server = http.createServer(function (req, res) {
    res.writeHead(200, {'Content-Type': 'application/json; charset=utf-8'}); // http header

    const url = req.url;

    if(url ==='/products'){
       res.write(JSON.stringify(
           [{name: "foo", description: "bar"}]
        )); //write a response
       res.end(); //end the response
    }else if(url ==='/reviews'){
       res.write('[]'); //write a response
       res.end(); //end the response
    }else{
       res.write('{}'); //write a response
       res.end(); //end the response
    }
})

//start listen
server.listen(port, function(){
 console.log("server start at port ", port);
});
