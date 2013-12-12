var https = require('https');

var consumer_key = '3MVG9Gmy2zmPB01qN1rLw_UQq4wjeywJ9hMq7nEAhP8vdla.eJe0mZ2aUvArZYuHmG_9LFFdI09HnzkhMm2HB';
var consumer_secret = '4538047268537587654';

baseUrl = 'https://test.salesforce.com/services/oauth2/authorize';
clientId = consumer_key;
redirectUri = encodeURIComponent('https://localhost/');

finalUrl = baseUrl + '?response_type=code&client_id=' + clientId + '&redirect_uri=' + redirectUri;

code = 'aPrxeoyeTpu7VD8fYvxhMw52Fs2QTSF2RB.0IIuy4YFGRL0uXEBwzUblfBjJlyw5Zv8R_Q.xCg=='

grantType = 'authorization_code';
// clientId already set
clientSecret = consumer_secret;
// redirectUri already set

tokenRequestBaseUri = 'https://test.salesforce.com/services/oauth2/token'
tokenUri = tokenRequestBaseUri + '?grant_type=' + grantType + '&client_id=' + clientId + '&client_secret=' + clientSecret + '&redirect_uri=' + redirectUri + '&code=' + encodeURIComponent(code);

console.log(finalUrl);
console.log(tokenUri);
/*
var options = {
  hostname: 'cs7.salesforce.com',
  path: '/services/data/v29.0',
  headers: {
    'Content-Type': 'application/json',
    //'Authorization': 'OAuth sessionId',
    'X-Pretty-Print': '1',
    'Accept': 'application/json',
    'Accept-Encoding': 'gzip'
  }
};

https.get(options, function(res) {
    console.log("statusCode: ", res.statusCode);
    console.log("headers: ", res.headers);

    res.on('data', function(d) {
      process.stdout.write(d);
    });

}).on('error', function(e) {
    console.error(e);
});

*/
