import { database } from "pg/lib/defaults.js";
import { schemas_configuration } from "../enums/schema_configuration.js";
import { STATUS_CODE } from "../enums/status_code.js";
import { schemas } from "../schemas/schemas.js";

async function schema_validation(request, response) {
  try {
    const path = request.path;
    const method = request.method;
    const body = response.locals.body;
    const FIRST_ERROR = 0;
    const schema_config = schemas_configuration.find((schema) => {
      if (schema.path === path && schema.method === method) {
        return true;
      }
    });

    const { value, error } = schemas[schema_config.schema_name].validate(body);

    if (error !== undefined) {
      console.log("schema error");
      response
        .status(STATUS_CODE.BAD_REQUEST)
        .send(error.details[FIRST_ERROR].message);
      return;
    }

    if (schema_config.uniques !== undefined) {
      for (let i = 0, len = schema_config.uniques.length; i < len; i++) {
        const config = schema_config.uniques[i];

        const query = await database.query(
          `SELECT ${config.property} FROM ${config.table} WHERE ${config.property}=$1`,
          [value[config.property]]
        );

        if (query.rowCount !== 0) {
          response
            .status(STATUS_CODE.CONFLICT)
            .send(`conflict: ${config.property}`);
          return;
        }
      }
    }

    response.locals.safe_body = value;
  } catch (error) {
    console.log(error);
    response.sendStatus(STATUS_CODE.SERVER_ERROR);
  }
}

export { schema_validation };
