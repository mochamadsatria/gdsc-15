const io = require("socket.io")(3000); // initialize the server and listen on port 3000
const { v4: uuidv4 } = require("uuid");

let rooms = [];

io.on("connection", (socket) => {
  //let globalRoomId;

  // socket.on("test", (data) => {
  //   console.log(data);
  //   socket.emit("test", "Hello!");
  // });

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

      //globalRoomId = rooms[availableRoomIndex]["roomId"];

      rooms[availableRoomIndex]["users"].push(data["uid"]);

      socket.join(rooms[availableRoomIndex]["roomId"]);

      socket.emit("join_room", rooms[availableRoomIndex]);
    } else {
      // Create a new room for the user
      const roomId = uuidv4();

      //globalRoomId = roomId;

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
        //console.log(key);
      });

    //socket.leave(data["roomId"]);
  });

  socket.on("disconnect", function () {});

  //   socket.on("disconnect", function () {
  //     try {
  //       let rooms = io.sockets; //.adapter.rooms;

  //       console.log(rooms);

  //       //   rooms.forEach(function (value, key) {
  //       //     //console.log(key, value);
  //       //     for (const room of value.values()) {
  //       //       socket
  //       //         .to(room)
  //       //         .emit("userLeftRoom", { message: "A user has left the room." });

  //       //       // Disconnect all other clients from the room
  //       //       const clients = io.sockets.adapter.rooms.get(room);

  //       //       if (clients) {
  //       //         let cc = io.sockets.in(room).rooms; //.forEach((socketa) => socketa.leave(room));

  //       //         //console.log(cc);
  //       //         //clients.forEach((client) => {
  //       //         //io.sockets.sockets[client].leave(room);
  //       //         //});
  //       //       }
  //       //     }
  //       //   });

  //       //   const roomsLeft = Object.keys(socket.rooms);
  //       //   const room = roomsLeft.length > 1 ? roomsLeft[1] : null; // get the room name
  //       //   const clientId = socket.id; // get the client ID
  //       //   console.log("Client disconnected from room:", room);
  //       //   console.log("Client ID:", clientId);

  //       //   if (room) {
  //     } catch (err) {
  //       console.error(err);
  //     }
  //   });

  // when a client disconnects
  //   socket.on("disconnect", () => {
  //     const rooms_left = Object.keys(socket.rooms);

  //     rooms_left.forEach((roomName) => {
  //       console.log(roomName);

  //       //   io.to(roomName).emit("user_left", { userId: socket.id }); // Notify all users in the room that the user has left
  //       //   io.sockets.in(roomName).disconnect(); // Disconnect all users in the room
  //     });

  // broadcast the message to all connected clients in the same room
  // io.to(data["roomId"]).emit("delete_room", 1);

  // finished_room_index = rooms.findIndex(
  //   (room) => room["roomId"] == data["roomId"]
  // );

  // rooms.splice(finished_room_index, 1);
  //});
});
