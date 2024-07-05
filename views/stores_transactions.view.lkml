view: stores_transactions {

  sql_table_name: `janno-sandbox-406508.store_demo_data.stores_transactions_1` ;;

  dimension: pk {
    primary_key: yes
    sql: concat(cast(${store_id} as string), cast(${date_raw} as string)) ;;
    hidden: yes
  }

  dimension: store_id {
    type: number
    sql: ${TABLE}.store_id ;;
  }

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: cust_group {
    type: number
    sql: ${TABLE}.cust_group ;;
  }

  measure: total_cust_group {
    type: sum
    sql: ${cust_group} ;;
  }

  measure: average_cust_group {
    type: average
    sql: ${cust_group} ;;
  }

  dimension: shop_category {
    type: string
    sql: ${TABLE}.shop_category ;;
  }

  dimension: shop_type {
    type: string
    sql: ${TABLE}.shop_type ;;
  }



  dimension: total_transactions {
    type: number
    sql: ${TABLE}.total_transactions ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }
  measure: count {
    type: count
  }

}
