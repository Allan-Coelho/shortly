import { STATUS_CODE } from "../enums/status_code.js";
import {
  select_url_by_id,
  insert_shorten_url,
  select_url_by_short_url,
} from "../repositories/urls_repository.js";
import { nanoid } from "nanoid";
import { insert_view } from "../repositories/views_repository.js";

async function get_url_by_id(request, response) {
  try {
    const { id } = response.locals.safe_data;
    const queryData = await select_url_by_id(id);

    response.send(queryData.rows[0]);
  } catch (error) {
    console.log(error.message);
    response.sendStatus(STATUS_CODE.SERVER_ERROR);
    return;
  }
}

async function create_shorten_url(request, response) {
  try {
    const { user_id } = response.locals;
    const { url } = response.locals.safe_data;
    const short_url = nanoid();
    const query = await insert_shorten_url(url, user_id, short_url);

    if (query.rowCount === 0) {
      console.log("failed to create url");
      response.sendStatus(STATUS_CODE.SERVER_ERROR);
      return;
    }

    response.send({
      shortUrl: short_url,
    });
  } catch (error) {
    console.log(error.message);
    response.sendStatus(STATUS_CODE.SERVER_ERROR);
    return;
  }
}

async function redirect_by_short_url(request, response) {
  try {
    const { shortUrl } = response.locals.safe_data;
    const query = await select_url_by_short_url(shortUrl);
    const query_insert_view = await insert_view(
      query.rows[0].id,
      query.rows[0].userId
    );

    if (query.rowCount === 0 || query_insert_view.rowCount === 0) {
      console.log("failed to get url");
      response.sendStatus(STATUS_CODE.SERVER_ERROR);
      return;
    }

    response.redirect(query.rows[0].shortUrl);
  } catch (error) {
    console.log(error.message);
    response.sendStatus(STATUS_CODE.SERVER_ERROR);
    return;
  }
}

function delete_url_by_id(request, response) {
  try {
    const { id } = response.locals.safe_data;
    const query = delete_url_by_id(id);

    if (query.rowCount === 0) {
      console.log("failed to delete url");
      response.sendStatus(STATUS_CODE.SERVER_ERROR);
      return;
    }

    response.sendStatus(STATUS_CODE.NO_CONTENT);
  } catch (error) {
    console.log(error.message);
    response.sendStatus(STATUS_CODE.SERVER_ERROR);
    return;
  }
}

export {
  get_url_by_id,
  create_shorten_url,
  redirect_by_short_url,
  delete_url_by_id,
};
