connection: "janno_store_explore_demo"

access_grant: limit_users {
  user_attribute: janno_explore_assistant
  allowed_values: [ "yes"]
}

include: "/views/*.view.lkml"

explore: store_transactions {

  required_access_grants: [limit_users]

  label: "Store Data Demo"
  view_label: "Store Transactions"

  join: forecasting_predictions {
    view_label: "Transaction Predictions"
    type: left_outer
    relationship: one_to_one
    sql_on: ${store_transactions.pk} = ${forecasting_predictions.pk} ;;
  }
}
