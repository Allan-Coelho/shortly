import express from "express";
import { signup } from "../controllers/user_controller.js";
import { html_sanitizer } from "../middlewares/html_sanitizer.js";

const router = express.Router();

router.get("/signup", html_sanitizer, signup);

export default router;
