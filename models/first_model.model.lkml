connection: "activision_snowflake"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: tennis_players{
   join: players {
     relationship: one_to_one
     sql_on: 1=1 ;;
   }

   join: winners_wrank_by_date {
    relationship: one_to_one
    sql_on: 1=1;;
   }

  join: losers_lrank_by_date {
    relationship: one_to_one
    sql_on: 1=1;;
  }
 }
explore: peter_tennis_view {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
}
