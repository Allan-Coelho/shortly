import Joi from "joi";
import { joiPasswordExtendCore } from "joi-password";

const JoiPassword = Joi.extend(joiPasswordExtendCore);

const schemas = {
  user_schema: Joi.object({
    name: Joi.string().min(1).required(),
    email: Joi.string().min(1).email().required(),
    password: JoiPassword.string()
      .min(8)
      .minOfSpecialCharacters(1)
      .minOfLowercase(1)
      .minOfUppercase(1)
      .minOfNumeric(1)
      .noWhiteSpaces()
      .required(),
    confirmPassword: Joi.ref("password"),
  }).unknown(false),

  signin_schema: Joi.object({
    email: Joi.string().min(1).email().required(),
    password: JoiPassword.string()
      .min(8)
      .minOfSpecialCharacters(1)
      .minOfLowercase(1)
      .minOfUppercase(1)
      .minOfNumeric(1)
      .noWhiteSpaces()
      .required(),
  }).unknown(false),

  id_schema: Joi.object({
    id: Joi.number().integer().required(),
  }).unknown(false),

  url_schema: Joi.object({
    url: Joi.string().uri().required(),
  })
    .unknown(false)
    .required(),
  short_url_schema: Joi.object({
    shortUrl: Joi.string().required(),
  })
    .unknown(false)
    .required(),
};

export { schemas };
