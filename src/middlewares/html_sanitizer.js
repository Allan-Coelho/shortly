import { stripHtml } from "string-strip-html";

const requestObjectsToSanitize = ["headers", "body", "query", "params"];
const propertiesToSanitize = [
  "name",
  "image",
  "stockTotal",
  "categoryId",
  "pricePerDay",
  "cpf",
  "id",
  "phone",
  "cpf",
  "birthday",
  "customerId",
  "gameId",
  "daysRented",
];

function html_sanitizer(request, response, next) {
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
}

export { html_sanitizer };