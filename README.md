Evan atherly : DEV1 <br>
Pablo sene : DEV2 <br>
Alexis lambert : DEV3 <br>

```mermaid
graph TD
    debut --> Cond1{"n <= 1 ?"}
    Cond1 -- Oui --> Sortie[return]
    Cond1 -- Non --> Init["i = 1, j = 0"]
    Init --> Cond2{"i < n ?"}
    Cond2 -- Faux --> S2["swap(0, j, a)"]
    Cond2 -- Vrai --> Cond3{"a[i] < a[0]"}
    Cond3 -- Oui --> S1["swap(++j, i, a)"]
    Cond3 -- Non --> Inc["i++"]
    S1 --> Inc
    Inc --> Cond2
    S2 --> Rec1["iqsort0(a, j)"]
    Rec1 --> Rec2["iqsort0(a + j + 1, n - j - 1)"]
```

```C
void iqsort0 ( int *a , int n )
{
    int i , j ;
    if ( n <=1)
        return ;
    for ( i = 1 , j = 0; i < n ; i ++)
        if ( a [ i ] < a [0])
            swap (++ j , i , a );
    swap (0 , j , a );
    iqsort0 (a , j );
    iqsort0 ( a + j +1 , n -j -1);
 }
 ```