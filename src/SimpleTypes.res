module String50 : {
  type t = private String50(string)
  let make: string => Belt.Result.t<t, string>
  let value: t => string
} = {
  type t = String50(string)

  let make = str =>
    if str === "" {
      Belt.Result.Error("`String50` must not be empty")
    } else if Js.String.length(str) > 50 {
      Belt.Result.Error("`String50` must not be more than 50 chars")
    } else {
      Belt.Result.Ok(String50(str))
    }

  let value = (String50(str)) => str
}

module EmailAddress : {
  type t = private EmailAddress(string)
  let make: string => Belt.Result.t<t, string>
  let value: t => string
} = {
  type t = EmailAddress(string)

  let make = str => {
    let isMatch = Js.Re.fromString(".+@.+")->Js.Re.exec_(str)->Belt.Option.isSome
    isMatch
      ? Belt.Result.Ok(EmailAddress(str))
      : Belt.Result.Error("`EmailAddress` must be an email address")
    }

  let value = (EmailAddress(str)) => str
}

module OrderId : {
  type t = private OrderId(string)
  let make: string => Belt.Result.t<t, string>
  let value: t => string
} = {
  type t = OrderId(string)

  let make = str =>
    if str === "" {
      Belt.Result.Error("`OrderId` must not be empty")
    } else if Js.String.length(str) > 50 {
      Belt.Result.Error("`OrderId` must not be more than 50 chars")
    } else {
      Belt.Result.Ok(OrderId(str))
    }

  let value = (OrderId(str)) => str
}

module UnitQuantity : {
  type t = private UnitQuantity(int)
  let make: int => Belt.Result.t<t, string>
  let value: t => int
} = {
  type t = UnitQuantity(int)

  let make = qty =>
    if qty < 1 {
      Belt.Result.Error("`UnitQuantity` cannot be less than 1")
    } else if qty > 1000 {
      Belt.Result.Error("`UnitQuantity` cannot be greater than 1000")
    } else {
      Belt.Result.Ok(UnitQuantity(qty))
    }

  let value = (UnitQuantity(qty)) => qty
}

module KilogramQuantity : {
  type t = private KilogramQuantity(float)
  let make: float => Belt.Result.t<t, string>
  let value: t => float
} = {
  type t = KilogramQuantity(float)

  let make = qty =>
    if qty < 0.05 {
      Belt.Result.Error("`KilogramQuantity` cannot be less than 0.05")
    } else if qty > 1000.0 {
      Belt.Result.Error("`KilogramQuantity` cannot be more than 1000.00")
    } else {
      Belt.Result.Ok(KilogramQuantity(qty))
    }

  let value = (KilogramQuantity(qty)) => qty
}

module GizmoCode: {
  type t = private GizmoCode(string)
  let make: string => Belt.Result.t<t, string>
  let value: t => string
} = {
  type t = GizmoCode(string)

  let make = code => {
    let isMatch = Js.Re.fromString("G\\d{3}")->Js.Re.exec_(code)->Belt.Option.isSome
    isMatch
      ? Belt.Result.Ok(GizmoCode(code))
      : Belt.Result.Error("`GizmoCode` must begin with a 'G' and be followed by 3 digits")
  }

  let value = (GizmoCode(code)) => code
}

module WidgetCode: {
  type t = private WidgetCode(string)
  let make: string => Belt.Result.t<t, string>
  let value: t => string
} = {
  type t = WidgetCode(string)

  let make = code => {
    let isMatch = Js.Re.fromString("W\\d{4}")->Js.Re.exec_(code)->Belt.Option.isSome
    isMatch
      ? Belt.Result.Ok(WidgetCode(code))
      : Belt.Result.Error("`WidgetCode` must begin with a 'W' and be followed by 4 digits")
  }

  let value = (WidgetCode(code)) => code
}

type productCode = Widget(WidgetCode.t) | Gizmo(GizmoCode.t)
type orderQuantity = Unit(UnitQuantity.t) | Kilogram(KilogramQuantity.t)
