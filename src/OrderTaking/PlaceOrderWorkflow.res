/* Order life cycle */
/* validated state */
type validatedOrderLine = {
  id: unit,
  orderId: unit,
  productCode: DomainApi.productCode,
  orderQuantity: DomainApi.orderQuantity,
  price: int,
}

type validatedOrder = {
  orderId: unit,
  customerInfo: string,
  shippingAddress: string,
  billingAddress: string,
  orderLines: list<validatedOrderLine>,
  billingAmount: int,
}

/* priced state */
type pricedOrderLine = {
  id: unit,
  orderId: unit,
  productCode: DomainApi.productCode,
  orderQuantity: DomainApi.orderQuantity,
  price: int,
}

type pricedOrder = {
  orderId: unit,
  customerInfo: string,
  shippingAddress: string,
  billingAddress: string,
  orderLines: list<pricedOrderLine>,
  billingAmount: int,
}

/* all states combined */
type order =
  Unvalidated(DomainApi.unvalidatedOrder) | Validated(validatedOrder) | Priced(pricedOrder)

/* Definitions of Internal Steps */

/* Validate order */

/* services used by ValidateOrder */

type checkProductCodeExists = DomainApi.productCode => bool
type checkedAddress = CheckedAddress(DomainApi.unvalidatedAddress)
type addressValidationError = AddressValidationError(string)
type checkAddressExists = DomainApi.unvalidatedAddress => Belt.Result.t<
  checkedAddress,
  addressValidationError,
>
type validationError = ValidationError(DomainApi.validationError)
/* type validateOrder = ( */
/* checkProductCodeExists, */
/* checkAddressExists, */
/* DomainApi.unvalidatedOrder, */
/* ) => Belt.Result.t<validatedOrder, validationError> */

/* Price order */

/* services used by PriceOrder */

type getProductPrice = DomainApi.productCode => int
type pricingError = ValidationError(DomainApi.validationError)
/* type priceOrder = () */
