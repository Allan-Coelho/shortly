import { STATUS_CODE } from "../enums/status_code.js";
import bcrypt from "bcrypt";
import {
  get_user_by_email,
  get_users,
  insert_user,
  get_user_by_id,
  get_user_views_count,
} from "../repositories/user_repository.js";
import { user_urls_views } from "../repositories/urls_repository.js";
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
async function get_me(request, response) {
  try {
    const { user_id } = response.locals;
    const user_data = await get_user_by_id(user_id);
    const users_view = await get_user_views_count(user_id);
    const users_urls_views = await user_urls_views(user_id);

    response.send({
      id: user_id,
      name: user_data.rows[0].name,
      visitCount: Number(users_view.rows[0].visitCount),
      shortenUrls: users_urls_views.rows,
    });
  } catch (error) {
    console.log(error.message);
    response.sendStatus(STATUS_CODE.SERVER_ERROR);
    return;
  }
}

async function get_ranking(request, response) {
  try {
    const users = await get_users();
    let ranking = [];
    console.log(users);
    for (let i = 0, len = users.rows.length; i < len; i++) {
      const user_data = users.rows[i];
      const user_id = user_data.id;
      const users_view = await get_user_views_count(user_id);
      const users_urls_views = await user_urls_views(user_id);

      ranking.push({
        id: user_id,
        name: user_data.name,
        linksCount: users_urls_views.rows.length,
        visitCount: Number(users_view.rows[0].visitCount),
      });
    }

    ranking.sort((a, b) => {
      return a.visitCount - b.visitCount;
    });

    const data = ranking.slice(-10).reverse();
    response.send(data);
  } catch (error) {
    console.log(error.message);
    response.sendStatus(STATUS_CODE.SERVER_ERROR);
    return;
  }
}

export { signup, signin, get_me, get_ranking };
