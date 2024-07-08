view: store_transactions {

  sql_table_name: `janno-sandbox-406508.store_demo_data.stores_transactions_1` ;;

  dimension: pk {
    primary_key: yes
    sql: concat(cast(${store_id} as string), cast(${TABLE}.date as string)) ;;
    hidden: yes
  }

  dimension: store_id {
    label: "Store ID"
    description: "Unique identifier for a store."
    type: number
    sql: ${TABLE}.store_id ;;
  }

  dimension_group: transaction_date {
    label: "Transaction "
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    sql: timestamp(${TABLE}.date) ;;
  }

  dimension: city {
    label: "City"
    description: "The city where the store is located."
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
    hidden: yes
  }

  dimension: cust_group {
    label: "Customer Group"
    description: "The group that the customer has been assigned to."
    type: number
    sql: ${TABLE}.cust_group ;;
  }

  dimension: shop_category {
    label: "Shop Category"
    description: "The category the is associated with the shop."
    type: string
    sql: ${TABLE}.shop_category ;;
  }

  dimension: shop_type {
    label: "Shop Type"
    type: string
    sql: ${TABLE}.shop_type ;;
  }

  dimension: transactions_dim {
    label: "Transactions (Dim)"
    type: number
    sql: ${TABLE}.total_transactions ;;
  }

  measure: total_transactions {
    label: "# Transactions"
    description: "Total number of transactions."
    type: sum
    sql: ${transactions_dim} ;;
  }

  measure: store_count {
    label: "# Stores"
    type: count_distinct
    sql: ${store_id} ;;
    value_format_name: decimal_0
  }

}
