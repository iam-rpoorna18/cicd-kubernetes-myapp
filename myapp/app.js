const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send("Hello Kubernetes");
});

app.listen(3000, "0.0.0.0", () => {
  console.log("Server running on 3000");
});
