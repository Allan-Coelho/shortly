import { database } from "../database/database.js";
import { v4 as uuid } from "uuid";
import bcrypt from "bcrypt";

function insertUser(name, email, password) {
  return database.query(
    "INSERT INTO users (name, email, password) VALUES ($1, $2, $3)",
    [name, email, bcrypt.hash(password, 10)]
  );
}

export { insertUser };
