type widgetCode = WidgetCode(string) // starting with "W" then 4 digits

type gizmoCode = GizmoCode(string)

type productCode = Widget(widgetCode) | Gizmo(gizmoCode)

type unitQuantity = UnitQuantity(int) // between 1 and 1000

type kilogramQuantity = KilogramQuantity(float) // between 0.05 and 100.00

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
