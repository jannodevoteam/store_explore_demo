connection: "janno_store_explore_demo"

include: "/views/*.view.lkml"

explore: store_transactions {
  label: "Store Data Demo"
  view_label: "Store Transactions"

  join: forecasting_predictions {
    view_label: "Transaction Predictions"
    type: left_outer
    relationship: one_to_one
    sql_on: ${store_transactions.pk} = ${forecasting_predictions.pk} ;;
  }
}
