import { STATUS_CODE } from "../enums/status_code.js";
import bcrypt from "bcrypt";
import {
  get_user_by_email,
  insert_user,
} from "../repositories/user_repository.js";
import { v4 as uuid } from "uuid";

import { insert_session } from "../repositories/authentication_repository.js";

async function signup(request, response) {
  try {
    const { name, email, password } = response.locals.safe_data;
    const query = await insert_user(name, email, password);

    if (query.rowCount === 0) {
      console.log("failed to insert user");
      response.sendStatus(STATUS_CODE.SERVER_ERROR);
      return;
    }

    response.sendStatus(STATUS_CODE.CREATED);
    return;
  } catch (error) {
    console.log(error.message);
    response.sendStatus(STATUS_CODE.SERVER_ERROR);
    return;
  }
}

async function signin(request, response) {
  try {
    const { email, password } = response.locals.safe_data;
    const user = await get_user_by_email(email);

    if (bcrypt.compareSync(password, user.rows[0].password)) {
      const token = uuid();
      const create_session = await insert_session(user.rows[0].id, token);

      if (create_session.rowCount === 0) {
        console.log("failed to signin user");
        response.sendStatus(STATUS_CODE.SERVER_ERROR);
        return;
      }

      response.send({
        token: token,
      });

      return;
    }

    response.sendStatus(STATUS_CODE.UNAUTHORIZED);
  } catch (error) {
    console.log(error.message);
    response.sendStatus(STATUS_CODE.SERVER_ERROR);
    return;
  }
}

export { signup, signin };
