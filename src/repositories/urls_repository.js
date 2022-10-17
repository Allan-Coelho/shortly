import { database } from "../database/database.js";

const TABLE = "urls";

function select_url_by_id(id) {
  return database.query(
    `SELECT (id, shortUrl, url) FROM ${TABLE} WHERE id=$1`,
    [id]
  );
}

function insert_shorten_url(url, user_id, short_url) {
  return database.query(
    `INSERT INTO ${TABLE} (url, shortUrl, userId) VALUES ($1, $2, $3)`,
    [url, short_url, user_id]
  );
}

function select_url_by_short_url(short_url) {
  return database.query(
    `SELECT (url, userId, id) FROM ${TABLE} WHERE shortUrl=$1`,
    [short_url]
  );
}

function delete_url_by_id(url_id) {
  return database.query(`DELETE FROM ${TABLE} WHERE id=$1`, [url_id]);
}

export { insert_shorten_url, select_url_by_id, select_url_by_short_url };
