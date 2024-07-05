# The name of this view in Looker is "Classification Predictions"
view: classification_predictions {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `janno-sandbox-406508.store_demo_data.classification_predictions` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "City" in Explore.

  dimension: city {
    type: number
    sql: ${TABLE}.city ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_city {
    type: sum
    sql: ${city} ;;  }
  measure: average_city {
    type: average
    sql: ${city} ;;  }

  dimension: class {
    type: number
    sql: ${TABLE}.class ;;
  }

  dimension: cust_group {
    type: number
    sql: ${TABLE}.cust_group ;;
  }

  dimension: prediction {
    type: number
    sql: ${TABLE}.prediction ;;
  }

  dimension: shop_category {
    type: number
    sql: ${TABLE}.shop_category ;;
  }

  dimension: shop_type {
    type: number
    sql: ${TABLE}.shop_type ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }
  measure: count {
    type: count
  }
}
