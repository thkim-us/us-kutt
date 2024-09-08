const { Router } = require("express");
const asyncHandler = require("express-async-handler");

const validators = require("../handlers/validators.handler");
const helpers = require("../handlers/helpers.handler");
const domains = require("../handlers/domains.handler");
const auth = require("../handlers/auth.handler");

const router = Router();

router.post(
  "/",
  helpers.viewTemplate("partials/settings/domain/add_form"),
  asyncHandler(auth.apikey),
  asyncHandler(auth.jwt),
  validators.addDomain,
  asyncHandler(helpers.verify),
  asyncHandler(domains.add)
);

router.delete(
  "/:id",
  helpers.viewTemplate("partials/settings/domain/delete"),
  asyncHandler(auth.apikey),
  asyncHandler(auth.jwt),
  validators.removeDomain,
  asyncHandler(helpers.verify),
  asyncHandler(domains.remove)
);

module.exports = router;