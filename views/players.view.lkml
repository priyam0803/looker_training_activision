view: players {
  derived_table: {
    sql: SELECT
         distinct winner as team_player
         FROM public.tennis
         union
        SELECT
         distinct loser as team_player
         FROM public.tennis

 ;;
  }



  dimension: player {
    type: string
    sql: ${TABLE}.team_player ;;
  }

#  measure: count {
#    hidden: yes
#    type: count
#    sql: ${player} ;;
#  }

  set: detail {
    fields: [player]
  }
}
