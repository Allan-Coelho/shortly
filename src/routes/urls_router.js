import express from "express";
import {
  get_url_by_id,
  create_shorten_url,
  redirect_by_short_url,
  delete_url_by_id,
} from "../controllers/urls_controller.js";
import { html_sanitizer } from "../middlewares/html_sanitizer.js";
import { authentication_verifier } from "../middlewares/authentication_verifier.js";
import { schema_validation } from "../middlewares/schema_validation.js";

const router = express.Router();

router.get("/urls/:id", html_sanitizer, schema_validation, get_url_by_id);
router.post(
  "/urls/shorten",
  html_sanitizer,
  schema_validation,
  authentication_verifier,
  create_shorten_url
);
router.get(
  "/urls/open/:shortUrl",
  html_sanitizer,
  schema_validation,
  redirect_by_short_url
);
router.delete(
  "/urls/:id",
  html_sanitizer,
  schema_validation,
  authentication_verifier,
  delete_url_by_id
);

export default router;
