import { STATUS_CODE } from "../enums/status_code.js";
import { insertUser } from "../repositories/userRepository.js";

async function signup(request, response) {
  try {
    const { name, email, password } = response.locals.safeBody;
    const query = await insertUser(name, email, password);

    if (query.rowCount === 0) {
      console.log("failed to insert user");
      response.sendStatus(STATUS_CODE.SERVER_ERROR);
      return;
    }

    response.sendStatus(STATUS_CODE.CREATED);
  } catch (error) {
    console.log(error);
    response.sendStatus(STATUS_CODE.SERVER_ERROR);
  }
}

export { signup };
