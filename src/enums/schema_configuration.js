import { STATUS_CODE } from "./status_code";

const schemas_configuration = Object.freeze([
  {
    path: "",
    method: "",
    schema_name: "",
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
]);

export { schemas_configuration };
