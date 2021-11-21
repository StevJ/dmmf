open OrderTaking

let uniqueQtyResult = UnitQuantity.create(999)
switch uniqueQtyResult {
| Error(msg) => Js.log(msg)
| Ok(v) => Js.log(UnitQuantity.value(v))
}

let kgQtyResult = KilogramQuantity.create(0.3)
switch kgQtyResult {
| Error(msg) => Js.log(msg)
| Ok(v) => Js.log(KilogramQuantity.value(v))
}
