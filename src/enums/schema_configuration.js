import { STATUS_CODE } from "./status_code.js";

const schemas_configuration = Object.freeze([
  {
    path: "",
    method: "",
    schema_name: "",
    request_data: "body | params | headers",
    uniques: [
      {
        property: "",
        table: "",
        must_not_exist: true,
        must_not_exist_status_code: STATUS_CODE.CONFLICT,
        error_details: true,
      },
    ],
  },
  {
    path: "/signup",
    method: "POST",
    schema_name: "user_schema",
    request_data: "body",
    uniques: [
      {
        property: "email",
        table: "users",
        must_not_exist: true,
        must_not_exist_status_code: STATUS_CODE.CONFLICT,
        error_details: true,
      },
    ],
  },
  {
    path: "/signin",
    method: "POST",
    schema_name: "login_schema",
    request_data: "body",
    uniques: [
      {
        property: "",
        table: "",
        must_not_exist: false,
        must_not_exist_status_code: STATUS_CODE.UNAUTHORIZED,
        error_details: false,
      },
    ],
  },
  {
    path: "/urls/:id",
    method: "GET",
    schema_name: "id_schema",
    request_data: "params",
    uniques: [
      {
        property: "id",
        table: "urls",
        must_not_exist: false,
        must_not_exist_status_code: STATUS_CODE.NOT_FOUND,
        error_details: true,
      },
    ],
  },
  {
    path: "/urls/shorten",
    method: "POST",
    schema_name: "url_schema",
    request_data: "body",
  },
]);

export { schemas_configuration };
