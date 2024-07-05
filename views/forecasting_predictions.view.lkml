# The name of this view in Looker is "Forecasting Predictions"
view: forecasting_predictions {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `janno-sandbox-406508.store_demo_data.forecasting_predictions` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "City" in Explore.

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: cust_group {
    type: string
    sql: ${TABLE}.cust_group ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: prediction {
    type: number
    sql: ${TABLE}.prediction ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_prediction {
    type: sum
    sql: ${prediction} ;;  }
  measure: average_prediction {
    type: average
    sql: ${prediction} ;;  }

  dimension: shop_category {
    type: string
    sql: ${TABLE}.shop_category ;;
  }

  dimension: shop_type {
    type: string
    sql: ${TABLE}.shop_type ;;
  }

  dimension: store_id {
    type: string
    sql: ${TABLE}.store_id ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }
  measure: count {
    type: count
  }
}
