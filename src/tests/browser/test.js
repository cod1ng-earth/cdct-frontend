
const puppeteer = require('puppeteer');
const axios = require('axios');

console.log('start...')

const dns = require('dns');

dns.resolve4('lesschrome', (err, addresses) => {
    if (err) throw err;
    console.log(`lesschrome_ip: ${JSON.stringify(addresses[0])}`);
    const lesschrome_ip = addresses[0];
    axios({
        method: 'get',
        url: `http://${lesschrome_ip}:9222/json/version`,
        // headers: {'Host': lesschrome_ip}
        // data: {
        //     firstName: 'Fred',
        //     lastName: 'Flintstone'
        // }
    })
    .then(function (response) {
        console.log('then', response.data)
    
        const webSocket = response.data.webSocketDebuggerUrl;
        console.log(`WebsocketUrl: ${webSocket}`);
    
        (async () => {
           try {
                const browser = await puppeteer.connect({browserWSEndpoint: webSocket});
                const page    = await browser.newPage();
                await page.goto('https://example.com');
                await page.screenshot({path: '/media/example.png'});
                // await browser.close();
                // await page.goto(`https://www.google.com`, {waitUntil: 'networkidle2'});
            }
           catch(e) {
                // console.log(e);
                console.log('catch meep', e);
           }
        })();
    }).catch(function (err) {
        console.log("axio_catch:", err.response)
    })
    ;


});


// (async () => {
//     try {
//         const browser = await puppeteer.connect(p_optons);
//     } catch (e) {
//         console.log("catch:", e);
//         return;
//     }
// //   const page = await browser.newPage();
// //   await page.goto('https://example.com');
// //   await page.screenshot({path: 'example.png'});

//     await browser.close();
// })();
