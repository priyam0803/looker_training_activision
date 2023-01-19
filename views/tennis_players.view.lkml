view: tennis_players {
  # # You can specify the table name if it's different from the view name:
    sql_table_name: public.tennis ;;
  #
  # # Define your dimensions and measures here, like this:
    dimension: atp {
  #    description: "Unique ID for each user that has ordered"
      type: number
      sql: ${TABLE}.atp ;;
    }
  dimension: user_id {
#  description: "Unique ID for each user that has ordered"
type: number
sql: ${TABLE}.user_id ;;
primary_key: yes
 }

    dimension: location {
    #    description: "Unique ID for each user that has ordered"
      type: string
      sql: ${TABLE}.location ;;
    }

  dimension: tournament {
    #    description: "Unique ID for each user that has ordered"
    type: string
    sql: ${TABLE}.tournament ;;
  }

  dimension: date {
    #    description: "Unique ID for each user that has ordered"
    type: date_time
    sql: ${TABLE}.date ;;
  }

  dimension: series {
    #    description: "Unique ID for each user that has ordered"
    type: string
    sql: ${TABLE}.series ;;
  }

  dimension: court {
    #    description: "Unique ID for each user that has ordered"
    type: string
    sql: ${TABLE}.court ;;
  }

  dimension: surface {
    #    description: "Unique ID for each user that has ordered"
    type: string
    sql: ${TABLE}.surface ;;
  }

  dimension: round {
    #    description: "Unique ID for each user that has ordered"
    type: string
    sql: ${TABLE}.round ;;
  }

  dimension: best_of {
    #    description: "Unique ID for each user that has ordered"
    type: number
    sql: ${TABLE}.best_of ;;
  }

  dimension: winner {
    #    description: "Unique ID for each user that has ordered"
    type: string
    sql: ${TABLE}.winner ;;
  }

  dimension: loser {
    #    description: "Unique ID for each user that has ordered"
    type: string
    sql: ${TABLE}.loser ;;
  }

  dimension: wrank {
    #    description: "Unique ID for each user that has ordered"
    type: number
    sql: ${TABLE}.wrank ;;
  }

  dimension: lrank {
    #    description: "Unique ID for each user that has ordered"
    type: number
    sql: ${TABLE}.lrank ;;
  }

  dimension: wpts {
    #    description: "Unique ID for each user that has ordered"
    type: number
    sql: ${TABLE}.wpts ;;
  }

  dimension: lpts {
    #    description: "Unique ID for each user that has ordered"
    type: number
    sql: ${TABLE}.lpts ;;
  }

  dimension: w1 {
    #    description: "Unique ID for each user that has ordered"
    type: number
    sql: ${TABLE}.w1 ;;
  }

  dimension: l1 {
    #    description: "Unique ID for each user that has ordered"
    type: number
    sql: ${TABLE}.l1 ;;
  }

  dimension: w2 {
    #    description: "Unique ID for each user that has ordered"
    type: number
    sql: ${TABLE}.w2 ;;
  }

  dimension: l2 {
    #    description: "Unique ID for each user that has ordered"
    type: number
    sql: ${TABLE}.l2 ;;
  }

  dimension: w3 {
    #    description: "Unique ID for each user that has ordered"
    type: number
    sql: ${TABLE}.w3 ;;
  }

  dimension: l3 {
    #    description: "Unique ID for each user that has ordered"
    type: number
    sql: ${TABLE}.l3 ;;
  }

  dimension: w4 {
    #    description: "Unique ID for each user that has ordered"
    type: number
    sql: ${TABLE}.w4 ;;
  }

  dimension: l4 {
    #    description: "Unique ID for each user that has ordered"
    type: number
    sql: ${TABLE}.l4 ;;
  }

  dimension: w5 {
    #    description: "Unique ID for each user that has ordered"
    type: number
    sql: ${TABLE}.w5 ;;
  }

  dimension: l5 {
    #    description: "Unique ID for each user that has ordered"
    type: number
    sql: ${TABLE}.l5 ;;
  }

  dimension: wsets {
    #    description: "Unique ID for each user that has ordered"
    type: number
    sql: ${TABLE}.wsets ;;
  }

  dimension: lsets {
    #    description: "Unique ID for each user that has ordered"
    type: number
    sql: ${TABLE}.lsets ;;
  }

  dimension: comment {
    #    description: "Unique ID for each user that has ordered"
    type: string
    sql: ${TABLE}.comment ;;
  }

  dimension: B365W {
    #    description: "Unique ID for each user that has ordered"
    type: number
    sql: ${TABLE}.B365W ;;
  }

  dimension: B365L {
    #    description: "Unique ID for each user that has ordered"
    type: number
    sql: ${TABLE}.B365L ;;
  }

  dimension: PSW {
    #    description: "Unique ID for each user that has ordered"
    type: number
    sql: ${TABLE}.PSW ;;
  }

  dimension: PSL {
    #    description: "Unique ID for each user that has ordered"
    type: number
    sql: ${TABLE}.PSL ;;
  }

  dimension: maxw {
    #    description: "Unique ID for each user that has ordered"
    type: number
    sql: ${TABLE}.maxw ;;
  }

  dimension: maxl {
    #    description: "Unique ID for each user that has ordered"
    type: number
    sql: ${TABLE}.maxl ;;
  }

  dimension: avgw {
    #    description: "Unique ID for each user that has ordered"
    type: number
    sql: ${TABLE}.avgw ;;
  }

  dimension: avgl {
    #    description: "Unique ID for each user that has ordered"
    type: number
    sql: ${TABLE}.avgl ;;
  }


  measure: Winning_Probability{
    #getting the winning ptobaility
    type: number
    sql: ${Sum_Wpts}/(${SUM_Lpts}+${Sum_Wpts});;
  }

  measure: Loosing_Probability {
    #getting the loosing prods
    type: number
    sql: ${SUM_Lpts}/(${SUM_Lpts}+${Sum_Wpts});;
  }

  measure: count_wpts {
    type: number
    sql: COUNT(${wpts}) ;;
  }

  measure: count_lpts {
    type: number
    sql: COUNT(${lpts}) ;;
  }



  measure: Count_Tournament {
    #Count Tournaments
    type: number
    sql: COUNT(${tournament}) ;;
  }

  measure: count_T {
    type: count
    drill_fields: [tournament]
  }

  measure: count_Surface {
    #count Surface
    type: number
    sql: count(${surface}) ;;
  }

  measure: count_Series {
    #Count Series
    type: number
    sql: COUNT(${series}) ;;
  }

  measure: Sum_Wpts {
    type: sum
    sql: ${wpts} ;;
  }

  measure: SUM_Lpts {
    type: sum
    sql: ${lpts} ;;
  }

  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: tennis_players {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
