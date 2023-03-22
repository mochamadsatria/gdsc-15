const express = require("express"); // import the Express.js library
const app = express(); // create a new Express.js application instance

// define a route for the root of the server
app.get("/", (req, res) => {
  res.send("Hello, world!"); // send a simple response back to the client
});

// start the server listening on port 3000
app.listen(3001, () => {
  console.log("Server started on port 3000");
});
