import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import user_router from "./routes/user_router.js";
import urls_router from "./routes/urls_router.js";

const server = express();

dotenv.config();

server
  .use(cors())
  .use(express.json())
  .use(user_router)
  .use(urls_router)
  .listen(process.env.PORT);
