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

module GizmoCode = {
  type gizmoCode = GizmoCode(string)

  /* let create : string => Js.Result.t(gizmoCode, string) */
  let create = code => {
    let isMatch = Js.Re.fromString("G\\d{3}")->Js.Re.exec_(code)->Js.Option.isSome
    isMatch
      ? Js.Result.Ok(GizmoCode(code))
      : Js.Result.Error("`GizmoCode` must begin with a 'G' and be followed by 3 digits")
  }

  let value = (GizmoCode(code)) => code
}

module WidgetCode = {
  type widgetCode = WidgetCode(string)

  let create = code => {
    let isMatch = Js.Re.fromString("W\\d{4}")->Js.Re.exec_(code)->Js.Option.isSome
    if isMatch {
      Js.Result.Ok(WidgetCode(code))
    } else {
      Js.Result.Error("`WidgetCode` must begin with a 'W' and be followed by 4 digits")
    }
  }

  let value = (WidgetCode(code)) => code
}

open UnitQuantity
open KilogramQuantity
open GizmoCode
open WidgetCode

type productCode = Widget(widgetCode) | GizmoCode(gizmoCode)

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
