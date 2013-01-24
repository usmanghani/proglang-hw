use "assign1.sml";

is_older((1,1,2013), (2,1,2013));
number_in_month([(1,1,2013), (1,2,2013), (2,1,2013)], 1) = 2;
number_in_months([(1,1,2013), (1,2,2013), (2,1,2013)], [1,2]) = 3;
dates_in_month([(1,1,2013), (1,2,2013), (2,1,2013)], 1) = [(1,1,2013),(2,1,2013)];
dates_in_months([(1,1,2013), (1,2,2013), (2,1,2013)], [1,2]) = [(1,2,2013),  (1,1,2013), (2,1,2013)];
get_nth(["1","2","3","4"], 3) = "3";
date_to_string((20,1,2013)) = "January 20, 2013";

number_before_reaching_sum(7, [1,2,3,4]);

what_month(59) = 2;
what_month(60) = 3;

fun rpt(a: int, times: int) = 
    if times = 0 then [] else 
    a :: rpt(a, times - 1);

rpt(1, 2) @ [2];

length(month_range(1,32));
oldest([]) = NONE;
oldest([(1,1,2013), (1,2,2013), (2,1,2013)]) = SOME (1,1,2013);



