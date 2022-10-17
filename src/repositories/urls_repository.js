import { database } from "../database/database.js";

const TABLE = "urls";

function select_url_by_id(id) {
  return database.query(`SELECT * FROM ${TABLE} WHERE id=$1`, [id]);
}

function insert_shorten_url(url, user_id, short_url) {
  return database.query(
    `INSERT INTO ${TABLE} (url, "shortUrl", "userId") VALUES ($1, $2, $3)`,
    [url, short_url, user_id]
  );
}

function select_url_by_short_url(short_url) {
  return database.query(`SELECT * FROM ${TABLE} WHERE "shortUrl"=$1`, [
    short_url,
  ]);
}

function remove_url_by_id(url_id) {
  return database.query(`DELETE FROM ${TABLE} WHERE id=$1`, [url_id]);
}

function urls_views() {
  return database.query(
    `SELECT URLS.ID, URLS."shortUrl", URLS.URL, COUNT(views.url_id) AS "visitCount" FROM URLS LEFT JOIN VIEWS ON URLS.ID = VIEWS.URL_ID GROUP BY URLS.ID`
  );
}

function user_urls_views(user_id) {
  return database.query(
    `SELECT URLS.ID, URLS."shortUrl", URLS.URL, COUNT(views.url_id) AS "visitCount" FROM URLS LEFT JOIN VIEWS ON URLS.ID = VIEWS.URL_ID WHERE urls."userId"=$1 GROUP BY URLS.ID`,
    [user_id]
  );
}

export {
  insert_shorten_url,
  select_url_by_id,
  select_url_by_short_url,
  remove_url_by_id,
  urls_views,
  user_urls_views,
};
