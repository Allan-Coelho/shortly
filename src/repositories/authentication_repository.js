import { database } from "../database/database.js";

function insert_session(user_id, token) {
  return database.query(
    "INSERT INTO sessions (user_id, token) VALUES ($1, $2)",
    [user_id, token]
  );
}

function get_session(token) {
  return database.query("SELECT * FROM sessions WHERE token=$1", [token]);
}

export { insert_session, get_session };
