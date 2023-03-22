const io = require("socket.io")(3000); // initialize the server and listen on port 3000
const { v4: uuidv4 } = require("uuid");

let rooms = [];

io.on("connection", (socket) => {
  socket.on("login", (data) => {
    // Check if there is an available room with less than 2 users
    let availableRoomIndex = -1;
    for (let i = 0; i < rooms.length; i++) {
      if (rooms[i]["users"].length < 2) {
        availableRoomIndex = i;
        break;
      }
    }

    if (availableRoomIndex !== -1) {
      // Assign the user to the available room

      rooms[availableRoomIndex]["users"].push(data["uid"]);

      socket.join(rooms[availableRoomIndex]["roomId"]);

      socket.emit("join_room", rooms[availableRoomIndex]);
    } else {
      // Create a new room for the user
      const roomId = uuidv4();

      rooms.push({
        roomId: roomId,
        users: [data["uid"]],
      });

      socket.join(roomId);

      socket.emit("joined_room_and_wait_for_queue", {
        roomId: roomId,
        users: [data["uid"]],
      });
    }
  });

  socket.on("room_ready", (data) => {
    // broadcast the message to all connected clients in the same room
    io.to(data["roomId"]).emit("proceed_to_chat", data);
  });

  // when a message is received from the client
  socket.on("message", (data) => {
    // broadcast the message to all connected clients in the same room
    io.to(data["roomId"]).emit("message", data);
  });

  socket.on("shutdown", function (data) {
    io.sockets
      .in(data["roomId"])
      .adapter.nsp.sockets.forEach(function (socket, key) {
        rooms.splice(
          rooms.findIndex((roomItem) => roomItem.roomId == data.roomId),
          1
        );

        socket.disconnect();
      });
  });

  socket.on("disconnect", function () {});
});
