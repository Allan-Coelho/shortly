import { database } from "../database/database.js";
import bcrypt from "bcrypt";

function insert_user(name, email, password) {
  return database.query(
    "INSERT INTO users (name, email, password) VALUES ($1, $2, $3)",
    [name, email, bcrypt.hashSync(password, 10)]
  );
}

function get_users() {
  return database.query("SELECT * FROM users");
}

function get_user_by_email(email) {
  return database.query("SELECT * FROM users WHERE email=$1", [email]);
}

function select_user_urls_by_id(user_id) {
  return database.query("SELECT * FROM urls WHERE userId=$1", [user_id]);
}

function get_user_by_id(user_id) {
  return database.query("SELECT * FROM users WHERE id=$1", [user_id]);
}

function get_user_views_count(user_id) {
  return database.query(
    'SELECT user_id, COUNT(*) AS "visitCount" FROM views WHERE user_id=$1 GROUP BY user_id;', [user_id]
  );
}

export {
  insert_user,
  get_users,
  get_user_by_email,
  get_user_by_id,
  select_user_urls_by_id,
  get_user_views_count,
};
