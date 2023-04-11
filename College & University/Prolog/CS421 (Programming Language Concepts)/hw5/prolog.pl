/*
 * Module        :  prolog.pl
 * Description   :  Prolog Rocks!
 * Project Name  :  hw5
 * Class         :  CS421 (Spring)
 * Date Modified :  5-8-2022
 * Author        :  Kong Jimmy Vang
 */

/* diminishes(X): satisfied only when X is a list of numbers in strictly decreasing order. */
diminishes([]).
diminishes([_]).
diminishes([X, Y | Z]) :- X > Y, diminishes([Y | Z]), !.

/* myMember(X, L): satisfied only when list L contains X. */
myMember(X, [X | _]).
myMember(X, [_ | T]) :- myMember(X, T).

/* unique(L, M): satisfied only when list M contains all of the elements of list L but where all 
 *  duplicates are removed. */
unique([], []).
unique([H | T], M) :- myMember(H, T), unique(T, M), !.
unique([H | T], [H | T2]) :- unique(T, T2).

/* both(X, Y, Z): satisfied only when list Z contains all elements that occur in both list X AND list Y. 
 *  List Z will not have any duplicate values. List Z is assumed to be an "output" variable. 
 *  The ordering of the elements in the output list is not semantically meaningful. */
both(X, Y, Z) :- unique(X, X2), unique(Y, Y2), bothHelper(X2, Y2, Z), !.

/* bothHelper(X, Y, Z): Helper Relation for both(X, Y, Z). */
bothHelper([], _, []).
bothHelper([X | XS], Y, [X | Z]) :- myMember(X, Y), bothHelper(XS, Y, Z).
bothHelper([X | XS], Y, Z) :- \+ myMember(X, Y), bothHelper(XS, Y, Z).

/* running(L, S): satisfied only when list S (a list of numbers) contains the running-sum of the numbers in list L. */
running([], []).
running([NUM | T], [NUM | ST]) :- running(T, NUM, ST).
running([], _, []).
running([NUM | T], SUM, [SH | ST]) :- SH is NUM + SUM, running(T, SH, ST).

/* myAppend(L1, L2, L3): satisfied when list L3 contains list L1 and L2 appended together.*/
myAppend([], L, L).
myAppend([X1 | L1], L2, [X1 | L3]) :- myAppend(L1, L2, L3).

/* combine(L1, L2, L3): satisfied only when L3 contains a sorted list of all elements contained in both 
 *  sorted-list L1 and sorted-list L2. L1 and L2 are sorted in non-decreasing order. */
combine([], [], []).
combine([], L, L).
combine(L, [], L).
combine([H1 | T1],[H2 | T2], L3) :- H1 =< H2, myAppend([H1], L1, L3), combine(T1, [H2 | T2], L1), !.
combine([H1 | T1],[H2 | T2], L3) :- myAppend([H2], L1, L3), combine(T2, [H1 | T1], L1).

/* myReverse(L1, L2): satisfied only when L2 contains a reversed list of L1.*/
myReverse(L1, L2) :- myReverseHelper(L1,[],L2).

/* myReverseHelper(X, Y, Z): Helper Relation for myReverse(L1, L2).*/
myReverseHelper([], Z, Z). 
myReverseHelper([X | XS], Y, Z) :- myReverseHelper( XS, [X | Y], Z).

/* countsIncrement(TEMP, X, L): Helper Relation for countsHelper(L1, L2). */
countsIncrement([], X, [[X,1]]).
countsIncrement([[H, COUNT] | T], H, [[H, RESULT] | T]) :- RESULT is COUNT + 1.
countsIncrement([[H, COUNT] | T], X, [[H, COUNT] | L]) :- H \= X, countsIncrement(T, X, L).

/* countsHelper(L1, L2): Helper Relation for counts(L1, L2). */
countsHelper([], []).
countsHelper([H | T], L2) :- countsHelper(T, TEMP), countsIncrement(TEMP, H, L2), !.

/* counts(L1, L2): satisfied only when L2 is a list, each element of which is a list of length two that 
 *  we refer to, for descriptive purposes, as an entry. The first item in an entry, refered to as the 
 *  element, is one of the elements in L1. The second element of an entry, referred to as the count, is the 
 *  number of times that element occurs in L1. The order of the elements in the histogram must correspond 
 *  with their ordering in L1. */
counts(L1, L2) :- myReverse(L1, REVERSED), countsHelper(REVERSED, L2).
