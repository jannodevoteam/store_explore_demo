view: forecasting_predictions {

  sql_table_name: `janno-sandbox-406508.store_demo_data.forecasting_predictions` ;;

  dimension: pk {
    primary_key: yes
    sql: concat(cast(${store_id} as string), cast(${date_raw} as string)) ;;
    hidden: yes
  }

  dimension: store_id {
    type: string
    sql: ${TABLE}.store_id ;;
  }

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    sql: timestamp(${TABLE}.date) ;;
  }

  dimension: prediction_dim {
    label: "Predicted Transactions (Dim)"
    type: number
    sql: ${TABLE}.prediction ;;
  }

  measure: total_predicted_transactions {
    label: "Total Predicted Transactions"
    type: sum
    sql: ${prediction_dim} ;;
  }

  dimension: prediction_percetage_diff_dim {
    label: "% Prediction Difference (Dim)"
    description: "The percentage difference between the actual transactions and predicted transactions. Closer to 0 is good."
    type: number
    sql: (${prediction_dim} - ${store_transactions.transactions_dim} ) / ${store_transactions.transactions_dim} ;;
    value_format_name: percent_2
    hidden: yes
  }

  measure: prediction_percetage_diff {
    label: "% Prediction Difference"
    description: "The percentage difference between the actual transactions and predicted transactions. Closer to 0 is good."
    sql: (${total_predicted_transactions} - ${store_transactions.total_transactions})
      / ${store_transactions.total_transactions} ;;
    value_format_name: percent_2
  }

  measure: avg_prediction_pec_diff {
    label: "Avg % Prediction Difference"
    description: "Average % error between the actual transaction and predicted transaction. Closer to 0 is good."
    type: average
    sql: ${prediction_percetage_diff_dim}  ;;
    value_format_name: percent_2
  }

}
