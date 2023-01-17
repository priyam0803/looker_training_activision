view: losers_lrank_by_date {
  derived_table: {
    sql: with loser as
      (
        SELECT
          loser  AS loser,
          COUNT(*) AS rounds
      FROM public.tennis
      GROUP BY
          1
      ORDER BY
          2 DESC
      limit 10
      ),
      lrank as
      (select date, loser, lrank
      from  public.tennis
      ),
      top_losers_rank_by_date as
      (
        select w.loser,cast(lr.date as date) as date,lr.lrank
        from loser w
        inner join lrank lr
        on w.loser = lr.loser
      )
      select * from top_losers_rank_by_date
      order by loser,date ;;
  }

  measure: lrank_avg {
    # hidden: yes
    type: average
    sql: ${lrank} ;;
  }

  dimension: loser {
    type: string
    sql: ${TABLE}."LOSER" ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}."DATE" ;;
  }

  dimension: lrank {
    type: number
    sql: ${TABLE}."LRANK" ;;
  }

  set: detail {
    fields: [loser, date, lrank]
  }
}
