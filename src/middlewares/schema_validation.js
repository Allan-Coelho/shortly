import { schemas_configuration } from "../enums/schema_configuration";
import { STATUS_CODE } from "../enums/status_code.js";
import { schemas } from "../schemas/schemas.js";

function schema_validation(request, response) {
  try {
    const path = request.path;
    const method = request.method;
    const body = response.locals.body;
    const schema_config = schemas_configuration.find((schema) => {
      if (schema.path === path && schema.method === method) {
        return true;
      }
    });

    const { safeValue, error } =
      schemas[schema_config.schema_name].validate(body);

    if (error !== undefined) {
      console.log(error);
      response.sendStatus(STATUS_CODE.BAD_REQUEST);
    }
  } catch (error) {
    console.log(error);
    response.sendStatus(STATUS_CODE.SERVER_ERROR);
  }
}
