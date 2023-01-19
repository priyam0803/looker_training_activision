view: winners_wrank_by_date {
  derived_table: {
    sql: with winner as
      (
        SELECT
          winner  AS winner,
          COUNT(*) AS rounds
      FROM public.tennis
      GROUP BY
          1
      ORDER BY
          2 DESC
      limit 10
      ),
      wrank as
      (select date, winner, wrank
      from  public.tennis
      ),
      top_players_rank_by_date as
      (
        select w.winner,cast(wr.date as date) as date,wr.wrank
        from winner w
        inner join wrank wr
        on w.winner = wr.winner
      )
      select * from top_players_rank_by_date
      order by winner,date
       ;;
  }

  measure: wrank_avg {
   # hidden: yes
    type: average
    sql: ${wrank} ;;
  }

  dimension: winner {
    type: string
    sql: ${TABLE}."WINNER" ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}."DATE" ;;
  }

  dimension: wrank {
    type: number
    sql: ${TABLE}."WRANK" ;;
  }

  set: detail {
    fields: [winner, date, wrank]
  }
}
