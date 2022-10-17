import express from "express";
import { signin, signup } from "../controllers/user_controller.js";
import { html_sanitizer } from "../middlewares/html_sanitizer.js";
import { schema_validation } from "../middlewares/schema_validation.js";

const router = express.Router();

router.post("/signup", html_sanitizer, schema_validation, signup);
router.post("/signin", html_sanitizer, schema_validation, signin);

export default router;
