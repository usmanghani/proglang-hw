
fun is_older (a: (int * int * int), b: (int * int * int)) = #1 a < #1 b orelse #2 a < #2 b orelse #3 a < #3 b;

fun number_in_month (dates: (int * int * int) list, month: int) =
    if null dates 
    then 0
    else
	if #2 (hd dates) = month then 1 + number_in_month(tl dates, month) else number_in_month(tl dates, month)

fun number_in_months(dates: (int * int * int) list, months: int list) = 
    if null months
    then 0
    else
	number_in_month(dates, hd months) + number_in_months(dates, tl months)

fun dates_in_month(dates: (int * int * int) list, month: int) = 
    if null dates
    then []
    else
	if #2 (hd dates) = month then (hd dates) :: dates_in_month(tl dates, month) else dates_in_month(tl dates, month)

fun dates_in_months(dates: (int * int * int) list, months: int list) = 
    if null dates then [] else if null months then [] else
        dates_in_months(dates, tl months) @ dates_in_month(dates, hd months)

fun get_nth(strings: string list, n: int) = 
    if n = 1 then hd strings else get_nth(tl strings, n - 1)

fun date_to_string(date: (int * int * int)) = 
    get_nth(["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"], #2 date) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)

fun number_before_reaching_sum(sum: int, listOfNumbers: int list) = 
    let fun num_internal(sum: int, listOfNumbers: int list, acc: int, counter: int) = 
        if (acc  + hd listOfNumbers) < sum then num_internal(sum, tl listOfNumbers, acc + hd listOfNumbers, counter + 1) else counter
    in
        num_internal(sum, listOfNumbers, 0, 0)
    end

fun what_month(day: int) = 
    number_before_reaching_sum(day, [31,28,31,30,31,30,31,31,30,31,30,31]) + 1

fun month_range(day1: int, day2: int) = 
    if day1 > day2 then [] else
    what_month(day1) :: month_range(day1 + 1, day2)

fun oldest(dates: (int * int * int) list) = 
    let fun minOfList(myList: (int * int * int) list, currentMin: (int * int * int)) = 
        if null myList then currentMin else if is_older((hd myList), currentMin) then minOfList(tl myList, hd myList) else minOfList(tl myList, currentMin)
    in
        if null dates then NONE else SOME (minOfList(tl dates, hd dates))
    end
