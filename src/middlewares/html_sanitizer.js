import { stripHtml } from "string-strip-html";
import { STATUS_CODE } from "../enums/status_code";

const requestObjectsToSanitize = ["headers", "body", "query", "params"];
const propertiesToSanitize = [
  "name",
  "email",
  "password",
  "confirmPassword",
  "id",
  "shortUrl",
  "url",
];

function html_sanitizer(request, response, next) {
  try {
    console.log("HTML sanitize begin");
    for (let j = 0, len0 = requestObjectsToSanitize.length; j < len0; j++) {
      const objectKey = requestObjectsToSanitize[j];
      const object = request?.[objectKey];

      if (!object) {
        continue;
      }

      for (let i = 0, len1 = propertiesToSanitize.length; i < len1; i++) {
        const propertyName = propertiesToSanitize[i];
        const propertyValue = String(object?.[propertyName]);

        if (propertyValue === "undefined" || propertyValue === undefined) {
          continue;
        }

        response.locals[objectKey] = { ...response.locals[objectKey] };
        response.locals[objectKey][propertyName] =
          stripHtml(propertyValue).result;
      }
    }

    next();
  } catch (error) {
    console.log(error.message);
    response.sendStatus(STATUS_CODE.SERVER_ERROR);
  }
}

export { html_sanitizer };
