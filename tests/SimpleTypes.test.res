open Zora
open SimpleTypes

zoraBlock("gizmo_code", t => {
  t->test("it results to an error when given wrong string format", t => {
    t->resultError(GizmoCode.make("123"), "Should return error")
    done()
  })
  t->test("it gets GizmoCode value", t => {
    let gizmoCode = GizmoCode.make("G123")
    t->resultOk(gizmoCode, (t, v) =>
      t->equal(GizmoCode.value(v), "G123", "Should return correct value")
    )
    done()
  })
})

zoraBlock("widget_code", t => {
  t->test("it results to an error when given wrong string format", t => {
    t->resultError(WidgetCode.make("foo"), "Should return error")

    done()
  })
  t->test("it gets WidgetCode value", t => {
    let widgetCode = WidgetCode.make("W1234")
    t->resultOk(widgetCode, (t, v) =>
      t->equal(WidgetCode.value(v), "W1234", "Should return correct value")
    )
    done()
  })
})

zoraBlock("unit quantity", t => {
  t->test("it results to an error when given invalid quantity", t => {
    t->resultError(UnitQuantity.make(3000), "Should return error")
    t->resultError(UnitQuantity.make(0), "Should return error")
    done()
  })
  t->test("it gets UnitQuantity value", t => {
    let unitQuantity = UnitQuantity.make(150)
    t->resultOk(unitQuantity, (t, v) =>
      t->equal(UnitQuantity.value(v), 150, "Should return correct value")
    )
    done()
  })
})

zoraBlock("kilogram quantity", t => {
  t->test("it results to an error when given invalid quantity", t => {
    t->resultError(KilogramQuantity.make(3000.0), "Should return error")
    t->resultError(KilogramQuantity.make(0.01), "Should return error")
    done()
  })
  t->test("it gets KilogramQuantity value", t => {
    let kilogramQuantity = KilogramQuantity.make(0.1)
    t->resultOk(kilogramQuantity, (t, v) =>
      t->equal(KilogramQuantity.value(v), 0.1, "Should return correct value")
    )
    done()
  })
})

zoraBlock("order id", t => {
  t->test("it results to an error when given invalid order id", t => {
    t->resultError(OrderId.make(""), "Should return error when empty")
    t->resultError(OrderId.make(Js.String.repeat(51, "x")), "Should return error when > 50 chars")
    done()
  })
  t->test("it gets OrderId value", t => {
    let orderId = OrderId.make("123456")
    t->resultOk(orderId, (t, v) =>
      t->equal(OrderId.value(v), "123456", "Should return correct value")
    )
    done()
  })
})

zoraBlock("string 50", t => {
  t->test("it results to an error when given invalid string", t => {
    t->resultError(String50.make(""), "Should return error when empty")
    t->resultError(String50.make(Js.String.repeat(51, "x")), "Should return error when > 50 chars")
    done()
  })
  t->test("it gets String50 value", t => {
    let orderId = String50.make("dudu didi")
    t->resultOk(orderId, (t, v) =>
      t->equal(String50.value(v), "dudu didi", "Should return correct value")
    )
    done()
  })
})
