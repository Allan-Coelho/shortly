import { database } from "../database/database.js";

const TABLE = "sessions";

function insert_session(user_id, token) {
  return database.query(
    `INSERT INTO ${TABLE} ("userId", token) VALUES ($1, $2)`,
    [user_id, token]
  );
}

function get_session(token) {
  return database.query(`SELECT * FROM ${TABLE} WHERE token=$1`, [token]);
}

export { insert_session, get_session };
