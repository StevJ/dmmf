module UnitQuantity = {
  type unitQuantity = UnitQuantity(int)

  let create = qty =>
    if qty < 1 {
      Js.Result.Error("`UnitQuantity` cannot be less than 1")
    } else if qty > 1000 {
      Js.Result.Error("`UnitQuantity` cannot be greater than 1000")
    } else {
      Js.Result.Ok(UnitQuantity(qty))
    }

  let value = (UnitQuantity(qty)) => qty

  let minimum = UnitQuantity(1)
}

module KilogramQuantity = {
  type kilogramQuantity = KilogramQuantity(float)

  let create = qty =>
    if qty < 0.05 {
      Js.Result.Error("`KilogramQuantity` cannot be less than 0.05")
    } else if qty > 1000.0 {
      Js.Result.Error("`KilogramQuantity` cannot be more than 1000.00")
    } else {
      Js.Result.Ok(KilogramQuantity(qty))
    }

  let value = (KilogramQuantity(qty)) => qty

  let minimum = KilogramQuantity(0.05)
}

open UnitQuantity
open KilogramQuantity

type widgetCode = WidgetCode(string) // starting with "W" then 4 digits

type gizmoCode = GizmoCode(string)

type productCode = Widget(widgetCode) | Gizmo(gizmoCode)

type orderQuantity =
  | Unit(unitQuantity)
  | Kilogram(kilogramQuantity)

type orderId = unit

type orderLineId = unit

type customerId = CustomerId(int)

type customerInfo = unit

type shippingAddress = unit

type billingAddress = unit

type price = unit

type billingAmount = unit

type orderLine = {
  id: orderLineId,
  orderId: orderId,
  productCode: productCode,
  orderQuantity: orderQuantity,
  price: price,
}

type order = {
  id: orderId,
  customerInfo: customerInfo,
  shippingAddress: shippingAddress,
  billingAddress: billingAddress,
  orderLine: list<orderLine>,
  billingAmount: billingAmount,
}

type acknowledgementSent = unit

type orderPlaced = unit

type billableOrderPlaced = unit

type placeOrderEvents = {
  acknowledgementSent: acknowledgementSent,
  orderPlaced: orderPlaced,
  billableOrderPlaced: billableOrderPlaced,
}

type validationError = {
  fieldName: string,
  errorDescription: string,
}

type placeOrderError = ValidationError(validationError)

type unvalidatedOrderLine = {
  productCode: string,
  orderQuantity: int,
}

type unvalidatedOrder = {
  orderId: string,
  customerId: string,
  shippingAddress: string,
  orderLines: list<unvalidatedOrderLine>,
}

type placeOrder = unvalidatedOrder => Belt.Result.t<placeOrderEvents, placeOrderError>
