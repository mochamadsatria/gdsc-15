const express = require("express");
const app = express();
const http = require("http").createServer(app);
const io = require("socket.io")(http);
const { ExpressPeerServer } = require("peer");
const peerServer = ExpressPeerServer(http);

// Initialize the peer server
app.use("/peerjs", peerServer);

// Serve the client-side code
// app.use(express.static(__dirname + "/public"));

// Start the HTTP server
http.listen(3000, () => {
  console.log("Listening on port 3000");
});

const peersByRoomId = {};

io.on("connection", (socket) => {
  // Join a room
  socket.on("join", (roomId) => {
    socket.join(roomId);
    const peers = getPeersInRoom(roomId);
    socket.emit("peers", peers);
  });

  // Leave a room
  socket.on("leave", (roomId) => {
    socket.leave(roomId);
  });

  // Handle a WebRTC signal
  socket.on("signal", (data) => {
    io.to(data.to).emit("signal", {
      from: data.from,
      signal: data.signal,
    });
  });
});

function getPeersInRoom(roomId) {
  const peers = Object.values(
    io.sockets.adapter.rooms.get(roomId)?.sockets || {}
  );
  return peers.map((peerId) => {
    return {
      id: peerId,
      conn: io.sockets.connected[peerId].peer,
    };
  });
}

peerServer.on("connection", (client) => {
  const roomId = client.query.roomId;
  if (!peersByRoomId[roomId]) {
    peersByRoomId[roomId] = {};
  }
  peersByRoomId[roomId][client.id] = client;

  client.on("call", (call) => {
    // Answer the incoming call and send the local stream to the remote peer
    call.answer(localStream);
    // Set up the call listeners for the remote peer
    call.on("stream", (remoteStream) => {
      // Handle the incoming stream from the remote peer
    });
    call.on("close", () => {
      // Handle the call closing
    });
  });

  client.on("close", () => {
    delete peersByRoomId[roomId][client.id];
    if (Object.keys(peersByRoomId[roomId]).length === 0) {
      delete peersByRoomId[roomId];
    }
  });

  const peers = getPeersInRoom(roomId);
  peers.forEach((peer) => {
    if (peer.id !== client.id) {
      // Call the remote peer and send the local stream
      const call = peer.conn.call(client.id, localStream);
      // Set up the call listeners for the remote peer
      call.on("stream", (remoteStream) => {
        // Handle the incoming stream from the remote peer
      });
      call.on("close", () => {
        // Handle the call closing
      });
    }
  });
});
