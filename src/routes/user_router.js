import express from "express";
import { get_me, signin, signup, get_ranking } from "../controllers/user_controller.js";
import { authentication_verifier } from "../middlewares/authentication_verifier.js";
import { html_sanitizer } from "../middlewares/html_sanitizer.js";
import { schema_validation } from "../middlewares/schema_validation.js";

const router = express.Router();

router.post("/signup", html_sanitizer, schema_validation, signup);
router.post("/signin", html_sanitizer, schema_validation, signin);
router.get("/users/me", html_sanitizer, authentication_verifier, get_me);
router.get("/ranking", get_ranking);

export default router;
