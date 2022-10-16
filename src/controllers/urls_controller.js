import { STATUS_CODE } from "./status_code.js";

function get_url_by_id(request, response) {
  try {
  } catch (error) {
    console.log(error.message);
    response.sendStatus(STATUS_CODE.SERVER_ERROR);
    return;
  }
}

function create_shorten_url(request, response) {
  try {
  } catch (error) {
    console.log(error.message);
    response.sendStatus(STATUS_CODE.SERVER_ERROR);
    return;
  }
}

function redirect_by_short_url(request, response) {
  try {
  } catch (error) {
    console.log(error.message);
    response.sendStatus(STATUS_CODE.SERVER_ERROR);
    return;
  }
}

function delete_url_by_id(request, response) {
  try {
  } catch (error) {
    console.log(error.message);
    response.sendStatus(STATUS_CODE.SERVER_ERROR);
    return;
  }
}

export { signup };
