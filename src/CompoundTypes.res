open SimpleTypes

type personalName = {
  firstName: String50.t,
  lastName: String50.t,
}

type customerInfo = {
  name: personalName,
  emailAddress: EmailAddress.t,
}
