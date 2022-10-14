import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import user_router from "./routes/user_router.js";

const server = express();

dotenv.config();

server
  .use(cors())
  .use(express.json())
  .use(user_router)
  .listen(process.env.PORT);
