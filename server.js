// Minimal Node server for Remix build
const http = require("http");
const { createRequestHandler } = require("@remix-run/serve");
const build = require("./build");

const port = process.env.PORT || 3000;

const handler = createRequestHandler({
  build,
  mode: process.env.NODE_ENV || "production"
});

const server = http.createServer((req, res) => {
  try {
    handler(req, res);
  } catch (err) {
    console.error("Request handler error:", err);
    res.statusCode = 500;
    res.end("Internal Server Error");
  }
});

server.listen(port, () => {
  console.log("Remix app listening on port", port);
});
