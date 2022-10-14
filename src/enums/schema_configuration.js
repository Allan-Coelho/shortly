const schemas_configuration = Object.freeze([
  {
    path: "",
    method: "",
    schema_name: "",
    uniques: [
      {
        property: "",
        table: "",
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
      },
    ],
  },
]);

export { schemas_configuration };
