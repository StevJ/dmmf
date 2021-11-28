/* Input data */
type productCode = Widget(Domain.WidgetCode.widgetCode) | Gizmo(Domain.GizmoCode.gizmoCode)
type orderQuantity =
  | Unit(Domain.UnitQuantity.unitQuantity)
  | Kilogram(Domain.KilogramQuantity.kilogramQuantity)

type unvalidatedAddress = string
type unvalidatedCustomer = {
  name: string,
  email: string,
}
type unvalidatedOrderLine = {
  productCode: productCode,
  orderQuantity: orderQuantity,
}
type unvalidatedOrder = {
  orderId: unit,
  customerInfo: unvalidatedCustomer,
  shippingAddress: unvalidatedAddress,
  orderLines: list<unvalidatedOrderLine>,
}

/* Input Command */
type command<'data> = {data: 'data, timestamp: string, userId: string}
type placeOrderCommand = command<unvalidatedOrder>

/* Public API */
type orderAcknowledgementSent = unit
type orderPlaced = unit
type billableOrderPlaced = unit
type validationError = {
  fieldName: string,
  errorDescription: string,
}

type placeOrderEvent =
  | OrderPlaced(orderPlaced)
  | BillableOrderPlaced(billableOrderPlaced)
  | AcknoledgmentSent(orderAcknowledgementSent)

type placeOrderError = ValidationError(validationError)
type placeOrderWorkflow = unvalidatedOrder => Belt.Result.t<placeOrderEvent, placeOrderError>
