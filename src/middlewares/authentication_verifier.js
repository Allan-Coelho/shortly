import { get_session } from "../repositories/authentication_repository";

async function authentication_verifier(request, response, next) {
  try {
    const { authorization } = request.headers;
    const token = authorization?.replace("Bearer ", "");
    const token_is_missing =
      authorization === undefined || !authorization.includes("Bearer ")
        ? true
        : false;
    const user_session = await get_session(token);
    const user_session_not_exist = user_session.rowCount === 0 ? false : true;

    if (token_is_missing) {
      response.status(401).send("authorization token is missing");
      return;
    }

    if (user_session_not_exist) {
      response.status(401).send("invalid authorization token");
      return;
    }

    response.locals.safe_body = user_session.user_id;
    next();
  } catch (error) {
    console.log(error.message);
    response.sendStatus(STATUS_CODE.SERVER_ERROR);
  }
}

export { authentication_verifier };