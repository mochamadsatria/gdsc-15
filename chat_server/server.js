const express = require("express");
const app = express();
const http = require("http").createServer(app);
const io = require("socket.io")(http);
const { v4: uuidv4 } = require('uuid');

const rooms = {};

io.on("connection", (socket) => {
  console.log("a user connected");

  // handle room joining
  socket.on("join room", () => {
    const roomId = uuidv4();
    console.log(`User joined room: ${roomId}`);

    // create a new room
    rooms[roomId] = [];

    // join the room
    socket.join(roomId);
    socket.emit("room joined", roomId);
  });

  // handle incoming messages
  socket.on("chat message", (msg, roomId) => {
    console.log(`Message received in room ${roomId}: ${msg}`);
    io.to(roomId).emit("chat message", msg);
  });

  // handle disconnections
  socket.on("disconnect", () => {
    console.log("a user disconnected");
  });
});

http.listen(3000, () => {
  console.log("listening on *:3000");
});
This code generate