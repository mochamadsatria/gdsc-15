const { io } = require("socket.io-client");

// connect to the server
const socket = io("http://localhost:3000");

let roomId = "";

socket.on("connect", () => {
  console.log("connected to server");

  socket.emit("login", { uid: "xxxxcccc" });
});

socket.on("join_room", (data) => {
  console.log("Joined a room and send dummy message");

  // send a message to the server
  socket.emit("room_ready", { roomId: data.roomId });
});

socket.on("joined_room_and_wait_for_queue", (data) => {
  console.log("wait for another client to join the room...");
});

socket.on("proceed_to_chat", (data) => {
  console.log("Actively receive chat...");

  roomId = data.roomId;

  // send a message to the server
  socket.emit("message", { roomId: data.roomId, message: "Hello, jii!" });
});

socket.on("message", (data) => {
  console.log("received message:", data.message, "with roomId: ", data.roomId);

  //socket.emit("message", { roomId: data.roomId, message: "Yes" }); // send a message to the server
});

socket.on("disconnect", () => {
  process.exit();
});

process.on("SIGINT", function () {
  // Send some data to the server
  socket.emit("shutdown", { roomId: roomId });

  // Disconnect the socket and exit the process
  socket.disconnect();
});
