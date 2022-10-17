import { database } from "../database/database.js";

const TABLE = "views";

function insert_view(url_id, user_id) {
  return database.query(
    `INSERT INTO ${TABLE} (url_id, user_id) VALUES ($1, $2)`,
    [url_id, user_id]
  );
}

export { insert_view };
