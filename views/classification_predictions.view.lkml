view: classification_predictions {

  sql_table_name: `janno-sandbox-406508.store_demo_data.classification_predictions` ;;

  dimension: city {
    type: number
    sql: ${TABLE}.city ;;
    primary_key: yes
  }

  dimension: customer_group {
    type: number
    sql: ${TABLE}.cust_group ;;
  }

  dimension: prediction {
    type: number
    sql: ${TABLE}.prediction ;;
  }

}
