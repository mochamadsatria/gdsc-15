const express = require("express");
const app = express();
const http = require("http").createServer(app);
const io = require("socket.io")(http);

const rooms = [];

io.on("connection", (socket) => {
  console.log("a user connected");

  // handle room joining
  socket.on("join room", (roomName) => {
    console.log(`User joined room: ${roomName}`);

    // create a new room if it doesn't exist
    if (!rooms.includes(roomName)) {
      rooms.push(roomName);
    }

    // join the room
    socket.join(roomName);
    socket.emit("room joined", roomName);
  });

  // handle incoming messages
  socket.on("chat message", (msg, roomName) => {
    console.log(`Message received in room ${roomName}: ${msg}`);
    io.to(roomName).emit("chat message", msg);
  });

  // handle disconnections
  socket.on("disconnect", () => {
    console.log("a user disconnected");
  });
});

http.listen(3000, () => {
  console.log("listening on *:3000");
});
