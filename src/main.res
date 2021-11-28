let uniqueQtyResult = Domain.UnitQuantity.create(997)
switch uniqueQtyResult {
| Error(msg) => Js.log(msg)
| Ok(v) => Js.log(Domain.UnitQuantity.value(v))
}

let kgQtyResult = Domain.KilogramQuantity.create(0.3)
switch kgQtyResult {
| Error(msg) => Js.log(msg)
| Ok(v) => Js.log(Domain.KilogramQuantity.value(v))
}

let gizmoCode = Domain.GizmoCode.create("G124")
switch gizmoCode {
| Error(msg) => Js.log(msg)
| Ok(v) => Js.log(Domain.GizmoCode.value(v))
}

let widgetCode = Domain.WidgetCode.create("W1234")
switch widgetCode {
| Error(msg) => Js.log(msg)
| Ok(v) => Js.log(Domain.WidgetCode.value(v))
}

let orderId = Domain.OrderId.create("xxx")
switch orderId {
| Error(msg) => Js.log(msg)
| Ok(v) => Js.log(Domain.OrderId.value(v))
}
